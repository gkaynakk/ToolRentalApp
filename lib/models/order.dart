import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _userId;
  String _status;
  num _createdAt;
  num _total;
//  getters
  String get id => _id;
  String get description => _description;
  String get userId => _userId;
  String get status => _status;
  num get total => _total;
  num get createdAt => _createdAt;

  List cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _description = snapshot.data()[DESCRIPTION];
    _total = snapshot.data()[TOTAL];
    _status = snapshot.data()[STATUS];
    _userId = snapshot.data()[USER_ID];
    _createdAt = snapshot.data()[CREATED_AT];
    cart = snapshot.data()[CART];
  }
}
