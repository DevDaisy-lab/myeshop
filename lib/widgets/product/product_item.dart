import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/product_detail_screen.dart';
import '../../providers/product.dart';
import '../../providers/cart.dart';

class ProductItem extends StatelessWidget {
  bool press = false;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white,
          ),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                        cart.addItem(
                          product.id,
                          product.price,
                          product.title,
                          product.imageUrl,
                        );
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Item added to cart!',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            backgroundColor: Colors.blue,
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                cart.removeSingleItem(product.id);
                              },
                            ),
                          ),
                        );
                      },
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Consumer<Product>(
                      builder: (ctx, product, _) => IconButton(
                        icon: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          product.toggleFavoriteStatus();
                        },
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: product.id,
                  child: Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          product.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
