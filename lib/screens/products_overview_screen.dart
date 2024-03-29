import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/products.dart';

import '../widgets/product/app_drawer.dart';
import '../widgets/product/badge.dart';
import '../widgets/product/spec_product_item.dart';
import '../widgets/product/banner.dart';
import '../widgets/product/products_grid.dart';

import './cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/product-overview';
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            color: Colors.blue,
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(
                  'Only Favorites',
                  style: Theme.of(context).textTheme.headline3,
                ),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text(
                  'Show All',
                  style: Theme.of(context).textTheme.headline3,
                ),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.itemCount.toString(),
              color: Colors.blue.shade300,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: 600,
                      height: 200,
                      child: SpecProductItem(),
                    ),
                    Bannerr(),
                    SizedBox(height: 15),
                    Container(
                      width: 600,
                      height: 800,
                      child: ProductsGrid(_showOnlyFavorites),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
