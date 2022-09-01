import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderIt {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderIt({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderIt> _orders = [];

  List<OrderIt> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse('https://nameofdatabase.firebaseio.com/orders.json');
    final response = await http.get(url);
    final List<OrderIt> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    // if (extractedData == null) { dart consider as an error
    //   return;
    // }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderIt(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                  imageUrl: item['imageUrl'],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse('https://nameofdatabase.firebaseio.com/orders.json');
    try {
      final timestamp = DateTime.now();
      final response = await http.post(
        url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        }),
      );
      _orders.insert(
        0,
        OrderIt(
          id: json.decode(response.body)['name'],
          amount: total,
          dateTime: timestamp,
          products: cartProducts,
        ),
      );
      notifyListeners();
    } catch (err) {
      print(err);
      throw err;
    }
  }
}
