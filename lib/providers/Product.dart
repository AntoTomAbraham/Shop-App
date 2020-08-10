import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isfavourite;

  Product({
    @required this.description,
    @required this.id,
    @required this.imageUrl,
    this.isfavourite = false,
    @required this.price,
    @required this.title,
  });

  void toggleFavouriteStatus() {
    isfavourite = !isfavourite;
    notifyListeners();
  }
}
