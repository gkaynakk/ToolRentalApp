import 'package:avadanlik/models/product.dart';
import 'package:avadanlik/service/products.dart';

import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<Product> products = [];
  List<Product> productsSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  // Future search({String productName})async{
  //   productsSearched = await _productServices.searchProducts(productName: productName);
  //   notifyListeners();
  // }

}
