import 'dart:async';
import 'package:avadanlik/models/product.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'products';

  Future<List<Product>> getFeaturedProducts() =>
      _firestore.collection(collection).get().then((snap) {
        List<Product> featuredProducts = [];
        snap.docs.map(
            (snapshot) => featuredProducts.add(Product.fromSnapshot(snapshot)));
        return featuredProducts;
      });
}
