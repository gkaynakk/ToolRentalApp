import 'package:avadanlik/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });
}
