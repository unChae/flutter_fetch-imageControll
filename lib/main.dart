import 'package:flutter/material.dart';

// screens
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/regist.dart';

void main() {
  runApp(MaterialApp(title: 'routes', initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/login': (context) => Login(),
    '/regist': (context) => Regist()
  }));
}
