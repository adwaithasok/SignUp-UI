import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/signup.dart';

Future<User?> createAccount(String name, String email, String password) async {
  FirebaseAuth _Auth = FirebaseAuth.instance;
  FirebaseFirestore _Firestore = FirebaseFirestore.instance;
  try {
    User? user = (await _Auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    print("user");
    print(user);
    if (user != null) {
      print("create account sucssesfull");
      return user;
    } else {
      print("account created failed");
    }

    return user;
  } catch (e) {
    print("Error");
    print(e);
    return null;
  }
}

Future<User?> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != "") {
      print('login sucsessfull');
      return user;
    } else {
      print('acout create failed');
    }
    return user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future logout(BuildContext context) async {
  FirebaseAuth _Auth = FirebaseAuth.instance;
  try {
    (await _Auth.signOut().then((value) {
      Navigator.pop(context);
    }));
  } catch (e) {
    print("error");
  }
}
