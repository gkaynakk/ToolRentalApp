import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.orange),
    home: Login(),
  ) //MaterialApp
      );
}
