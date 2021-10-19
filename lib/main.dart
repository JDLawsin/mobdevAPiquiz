import 'package:apiquiz/router/route.dart';
import 'package:flutter/material.dart';
import 'package:apiquiz/pages/login.dart';

void main() {
  runApp(MaterialApp(
    routes: routes,
    theme: ThemeData(
      textTheme: const TextTheme(
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
      ).apply(
        bodyColor: Colors.orange,
        displayColor: Colors.blue,
      ),
    ),
    home: const Login(),
  ));
}
