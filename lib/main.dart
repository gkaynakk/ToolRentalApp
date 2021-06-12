import 'package:avadanlik/provider/app_provider.dart';
import 'package:avadanlik/provider/product_provider.dart';
import 'package:avadanlik/screens/homePage.dart';
import 'package:avadanlik/screens/splash.dart';
import 'package:flutter/material.dart';

//my own imports
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';
import 'provider/user_provider.dart';
import 'provider/app_provider.dart';
import 'package:avadanlik/provider/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default:
        return Login();
    }
  }
}
