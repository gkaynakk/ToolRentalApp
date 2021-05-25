import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = 'users';
  void createUser(Map<String, dynamic> data) async {
    await _firestore
        .collection(collection)
        .doc(data["uid"])
        .set(data)
        .then((value) => print("Kullanıcı eklendi"))
        .catchError((error) => print("Kullanıcı eklenemedi: $error"));
  }
}
