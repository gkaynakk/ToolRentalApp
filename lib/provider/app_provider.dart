import 'package:avadanlik/service/featured.dart';
import 'package:avadanlik/models/product.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  bool isLoading = false;

  void changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
