import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  static const routeName = '/orders';
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle4 = Theme.of(context).textTheme.headline4;
    return Drawer(
      backgroundColor: Colors.lightBlue[50],
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Colors.blue,
            ),
            title: Text(
              'Shop',
              style: textStyle4,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.blue,
            ),
            title: Text(
              'Orders',
              style: textStyle4,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/orders');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            title: Text(
              'Manage Product',
              style: textStyle4,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/user-products');
            },
          ),
        ],
      ),
    );
  }
}
