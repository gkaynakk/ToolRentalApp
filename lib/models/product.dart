import 'package:avadanlik/models/cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  //  constants
  static const BRAND = 'brand';
  static const CATEGORY = 'category';
  //static const String COLORS = 'colors';
  static const DESCRIPTION = "description";
  static const FEATURED = 'featured';
  static const ID = 'id';
  static const NAME = 'name';

  static const PICTURE = 'picture';
  //static const PRICE = 'price';
  static const RENT = 'rent'; // kira

  static const AVAILABLEDAYS = 'availabledays'; //gün
  static const SALE = 'sale'; //sale = liste fiyatı

  //static const String SIZE = 'size';

  //  private variables
  String _brand;

  String _category;
  String _description;
  String _imageUrl;

  String _id;
  String _name;
  String _picture;
  //double _price;
  num _rent;

  //int _quantity;
  // List<String> _colors;
  // List<String> _size;
  bool _featured;
  num _sale;
  // num _availabledays;
  //  getters
  String get brand => _brand;
  String get imageUrl => _imageUrl;
  String get category => _category;
  String get description => _description;
  String get id => _id;
  String get name => _name;
  String get picture => _picture;
  // num get availabledays => _availabledays;
  //double get price => _price;
  num get rent => _rent;

  // int get quantity => _quantity;
  // List<String> get colors => _colors;
  // List<String> get size => _size;
  bool get featured => _featured;
  num get sale => _sale;

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    // _availabledays = snapshot.data()[AVAILABLEDAYS];
    _brand = snapshot.data()[BRAND];
    _sale = snapshot.data()[SALE];
    _description = snapshot.data()[DESCRIPTION] ?? " ";
    _featured = snapshot.data()[FEATURED];

    ///_price = snapshot.data()PRICE].floor();
    _rent = snapshot.data()[RENT];
    _category = snapshot.data()[CATEGORY];

    // _colors = snapshot.data()[COLORS];
    // _sizes = snapshot.data()[SIZES];
    _name = snapshot.data()[NAME];
    _picture = snapshot.data()[PICTURE];
  }
}
