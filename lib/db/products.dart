import 'package:avadanlik/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../db/products.dart';

import 'dart:async';

class ProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'products';

  Future<List<Product>> getFeaturedProducts() => _firestore
          .collection(collection)
          .where('featured', isEqualTo: true)
          .get()
          .then((snap) {
        List<Product> featuredProducts = [];
        snap.docs.map(
            (snapshot) => featuredProducts.add(Product.fromSnapshot(snapshot)));
        return featuredProducts;
      });
}
