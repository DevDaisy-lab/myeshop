import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/spec_product_item.dart';
import '../widgets/badge.dart';
import '../widgets/banner.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
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
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            'Pirk Patogiai',
            style: Theme.of(context).textTheme.headline1,
          ),
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
                child: ch,
                value: cart.itemCount.toString(),
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
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Bannerr(),
                      SizedBox(height: 10),
                      Container(
                        width: 600,
                        height: 800,
                        child: ProductsGrid(_showOnlyFavorites),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
