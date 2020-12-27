import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

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
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            accentColor: Colors.grey,
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 26.0,
                  ),
                  headline2: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22.0,
                  ),
                  headline3: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                  headline4: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
          }),
    );
  }
}
