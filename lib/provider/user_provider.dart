import 'package:avadanlik/models/cart_item.dart';
import 'package:avadanlik/models/product.dart';
import 'package:avadanlik/models/user.dart';
import 'package:avadanlik/service/orders.dart';
import 'package:avadanlik/service/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import 'dart:async';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;

  Status get status => _status;
  User get user => _user;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  UserModel _userModel;
  UserModel get userModel => _userModel;
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticated;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        _firestore
            .collection('users')
            .doc(user.user.uid)
            .set({'name': name, 'email': email, 'uid': user.user.uid});
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);

      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart({Product product /*int availabledays*/}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.picture,
        "productId": product.id,
        "rent": product.rent,
        // "availabledays": availabledays,
        // "totalPay": product.rent //* availabledays
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("SEPETTEKİ ÜRÜN: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);

//      }

      return true;
    } catch (e) {
      print("HATA ${e.toString()}");
      return false;
    }
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("ÜRÜN: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("HATA ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    var orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }
}
