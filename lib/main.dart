import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_loginsystems_1/menulist.dart';
import 'package:flutter_loginsystems_1/menupage.dart';
import 'package:flutter_loginsystems_1/userinfo.dart';
import 'forgot.dart';
import 'home.dart';
import 'login.dart';
import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCGB4qUmhI4uJcgq4AMBDcPpbD9I0HqiG8",
            authDomain: "mathematicswebapplicatio-ee70d.firebaseapp.com",
            projectId: "mathematicswebapplicatio-ee70d",
            storageBucket: "mathematicswebapplicatio-ee70d.firebasestorage.app",
            messagingSenderId: "685454574937",
            appId: "1:685454574937:web:bbf11c33ddc73483d33848",
            measurementId: "G-0NDXKVB5GQ"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'forgot': (context) => MyForgotPassword(),
      'home': (context) => MyHome(),
      'menupage': (context) => MyMenuPages(),
      'menulist': (context) => MyMenuLists(),
      'userinfo': (context) => UserProfile(),
    },
  ));
}
