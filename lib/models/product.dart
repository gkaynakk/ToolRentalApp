import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  //  constants
  static const String BRAND = 'brand';
  static const String CATEGORY = 'category';
  //static const String COLORS = 'colors';
  static const String FEATURED = 'featured';
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String PICTURE = 'picture';
  static const String PRICE = 'price'; //liste fiyatı
  static const String QUANTITY = 'quantity'; //gün
  static const String SALE = 'sale'; //günlük kira
  //static const String SIZE = 'size';

  //  private variables
  String _brand;
  String _category;
  String _id;
  String _name;
  String _picture;
  double _price;
  int _quantity;
  // List<String> _colors;
  // List<String> _size;
  bool _featured;
  bool _sale;

  //  getters
  String get brand => _brand;
  String get category => _category;
  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  double get price => _price;
  int get quantity => _quantity;
  // List<String> get colors => _colors;
  // List<String> get size => _size;
  bool get featured => _featured;
  bool get sale => _sale;

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _brand = snapshot.data()[BRAND];
    _sale = snapshot.data()[SALE];
    // _description = snapshot.data()[DESCRIPTION] ?? " ";
    _featured = snapshot.data()[FEATURED];
    _price = snapshot.data()[PRICE].floor();
    _category = snapshot.data()[CATEGORY];
    // _colors = snapshot.data()[COLORS];
    // _sizes = snapshot.data()[SIZES];
    _name = snapshot.data()[NAME];
    _picture = snapshot.data()[PICTURE];
  }
}
