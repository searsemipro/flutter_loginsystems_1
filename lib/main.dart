import 'package:flutter/material.dart';
import 'forgot.dart';
import 'home.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'forgot': (context) => MyForgotPassword(),
      'home': (context) => MyHome(),
    },
  ));
}
