import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:signup/methods.dart';

import 'reuseblewidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onLoginBtnPresss() {
    logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Card(
                      color: Colors.lightBlueAccent,
                      child: Center(
                          child: Text(
                        "welcome",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ))),
                ),
              ),
            ),
            firebaseUIButton(
              context,
              "Logout",
              onLoginBtnPresss,
            )
          ],
        ),
      ),
    );
  }
}
