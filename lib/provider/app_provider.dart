import 'package:avadanlik/service/featured.dart';
import 'package:avadanlik/models/product.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  List<Product> _featureProducts = [];
  ProductsServices _productServices = ProductsServices();

  AppProvider() {
    _getFeaturedProducts();
  }

  //getter
  List<Product> get featureProducts => _featureProducts;

  //methods
  void _getFeaturedProducts() async {
    _featureProducts = await _productServices.getFeaturedProducts();
    notifyListeners();
  }
}
