import 'package:flutter/material.dart';
import 'package:shop_app/screen/user_product_screen.dart';
import '../screen/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello Friend!"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text(
              "Shop",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Order",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            leading: Icon(Icons.payment),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersScreen(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "Manage Products",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
