import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/homepage.dart';
import 'package:signup/login.dart';
import 'package:signup/signup.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return MyHomePage();
    } else {
      return loginPage();
    }
  }
}