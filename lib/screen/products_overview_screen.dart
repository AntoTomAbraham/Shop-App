import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screen/cart_screen.dart';
import 'package:shop_app/widget/app_drawer.dart';
import 'package:shop_app/widget/products_grid.dart';
import 'package:shop_app/widget/badge.dart';
import './cart_screen.dart';

enum FilterOption {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showOnlyFavourities = false;
  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("shoppe"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption selectedvalue) {
              setState(() {
                if (selectedvalue == FilterOption.Favourites) {
                  showOnlyFavourities = true;
                  // productsContainer.showFavouritiesOnly();
                } else {
                  showOnlyFavourities = false;
                  //      productsContainer.showAll();
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text("Only Favourities"),
                  value: FilterOption.Favourites),
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showOnlyFavourities),
    );
    return scaffold;
  }
}
