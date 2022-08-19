import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/user_products_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyeShop',
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
                headline2: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0,
                ),
                headline3: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0,
                ),
                headline4: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
                headline5: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.lightBlue[500],
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0,
                ),
              ),
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
            secondary: Colors.lightBlue[400],
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
