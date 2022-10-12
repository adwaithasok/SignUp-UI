import 'package:flutter/material.dart';
import 'package:signup/reuseblewidget.dart';
import 'package:signup/signup.dart';

import 'homepage.dart';
import 'methods.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late bool _isHidden = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final _emailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  bool isLOading = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  String _userEmail = "";

  String _userpassword = "";

  void _submitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      print("Evrithing looks good!");
      print(_userEmail);
      print(_userpassword);
    }
  }

  void onLoginBtnPress() {
    _submitForm();
    if (_emailcontroller.text.isNotEmpty &&
        _passwordcontroller.text.isNotEmpty) {
      setState(() {
        isLOading = true;
      });
      login(_emailcontroller.text, _passwordcontroller.text).then((user) {
        if (user != null) {
          print('log in sucsess');
          setState(() {
            isLOading = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MyHomePage()));
        } else {
          setState(() {
            isLOading = false;
          });
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Login Failed"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"))
                    ],
                  ));
        }
      });
    } else {
      print('please fill form correctly');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logincover.png"),
                            fit: BoxFit.cover)),
                    padding: const EdgeInsets.only(top: 50.0),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 340, left: 25, right: 25),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 540,
                        child: Center(
                          child: Card(
                            color: Colors.white,
                            elevation: 30,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 40),
                              child: Column(
                                children: [
                                  const Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    "sign in to continue",
                                    style: TextStyle(color: Color(0xff98e0f3)),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  TextFormField(
                                      controller: _emailcontroller,
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'please enter your email adress';
                                        }
                                        if (!RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                          return 'please enter a valid email adress';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        fillColor: Colors.black12,
                                        filled: true,
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.grey,
                                          ), // icon is 48px widget.
                                        ),
                                        hintText: 'Email or Phone',
                                        hintStyle:
                                            const TextStyle(fontSize: 14),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 20.0, 10.0),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                      controller: _passwordcontroller,
                                      validator: (value) {
                                        if (value!.trim().length < 8) {
                                          return 'Password must be at least 8 characters in length';
                                        }
                                        return null;
                                      },
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      autofocus: false,
                                      obscureText: _isHidden,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2.0,
                                          ),
                                        ),
                                        fillColor: Colors.black12,
                                        filled: true,
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.grey,
                                          ), // icon is 48px widget.
                                        ),
                                        hintText: 'Password',
                                        suffix: InkWell(
                                          onTap: _togglePasswordView,
                                          child: Icon(
                                            _isHidden
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        hintStyle: TextStyle(fontSize: 14),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                20.0, 10.0, 20.0, 10.0),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Container(
                                    width: 200,
                                    height: 40,
                                    child: ElevatedButton(
                                        onPressed: onLoginBtnPress,
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromARGB(
                                                        255, 135, 213, 250))),
                                        child: isLOading
                                            ? Container(
                                                width: 30,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ))
                                            : Text("Login")),
                                  ),
                                  // firebaseUIButton(
                                  //     context, "Login", onLoginBtnPress),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Don't have a account?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      signUppage()));
                                        },
                                        child: const SizedBox(
                                          height: 15,
                                          child: Text("Sign up",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Color(0xff98e0f3))),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
