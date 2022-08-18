import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    final textStyle4 = Theme.of(context).textTheme.headline4;
    final textStyle5 = Theme.of(context).textTheme.headline5;
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: textStyle4,
            ),
            content: Text(
              'Do you want to remove the item from the cart?',
              style: textStyle4,
            ),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              title,
              style: textStyle4,
            ),
            subtitle: Text(
              'Total: \$${(price * quantity)}',
              style: textStyle5,
            ),
            trailing: Text(
              '$quantity x',
              style: textStyle5,
            ),
          ),
        ),
      ),
    );
  }
}
