import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final textsStyle3 = Theme.of(context).textTheme.headline3;
    final textsStyle2 = Theme.of(context).textTheme.headline2;
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    print(loadedProduct.description);
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              height: 330,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${loadedProduct.title}',
              style: textsStyle2,
              textScaleFactor: 2.0,
            ),
            SizedBox(height: 8),
            Chip(
              backgroundColor: Colors.blue,
              label: Text(
                '\$${loadedProduct.price}',
                style: textsStyle3,
                textScaleFactor: 1.2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 300,
              child: Text(
                loadedProduct.description!,
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
