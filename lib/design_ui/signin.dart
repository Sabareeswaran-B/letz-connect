import 'dart:async';

import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/connect_main.dart';
import 'package:cia_client/design_ui/signup.dart';
import 'package:cia_client/user_repository.dart';
import 'package:flutter/cupertino.dart';
// import 'package:cia_client/user_repository.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureTextPassword = true;

  bool _emailError = false;
  bool _passwordError = false;
  bool _emailEmpty = false;
  bool _passwordEmpty = false;

  void _validateAndSignIn() async {
    if (!_email.text.contains("@")) {
      _emailError = true;
    }
    if (!_emailError && !_passwordError) {
      var user = await UserRepository().signin(_email.text, _password.text);
      if (user != null) {
        if (user['message'] == "Invalid email") {
          setState(() {
            _emailError = true;
          });
        }
        if (user['message'] == "Invalid password") {
          setState(() {
            _passwordError = true;
          });
        }
        if (user['success'] == true) {
          print(user);
          Timer(Duration(milliseconds: 500), () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => ConnectMain(),
              ),
            );
          });
        }
      }
    }
  }

  Widget _errormsg(String msg) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 25),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_rounded,
              // FontAwesomeIcons.exclamationCircle,
              size: 20,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text(
              msg,
              style: TextStyle(
                color: Colors.red,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 35,
            ),
          ),
          centerTitle: true,
          title: Text("Sign in"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Align(
                  alignment: Alignment.center,
                  child: connectTitle,
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Username/ Email ID"),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.black, width: 0.5),
                      color: backgroundColor,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        setState(() {
                          _emailEmpty = false;
                          _emailError = false;
                        });
                      },
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15),
                      ),
                      cursorColor: Colors.black,
                    )),
                _emailError
                    ? _errormsg("*Invalid email! Please check your email")
                    : SizedBox(),
                _emailEmpty
                    ? _errormsg("*Please enter your email")
                    : SizedBox(),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password"),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.black, width: 0.5),
                      color: backgroundColor,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: _obscureTextPassword,
                      onChanged: (value) {
                        setState(() {
                          _passwordEmpty = false;
                          _passwordError = false;
                        });
                      },
                      controller: _password,
                      // keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _obscureTextPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _obscureTextPassword
                                  ? Colors.grey.shade400
                                  : primaryColor),
                          onPressed: () {
                            setState(() =>
                                _obscureTextPassword = !_obscureTextPassword);
                          },
                        ),
                      ),
                      cursorColor: Colors.black,
                    )),
                _passwordError
                    ? _errormsg("*Wrong Password! Please check your password")
                    : SizedBox(),
                _passwordEmpty
                    ? _errormsg("*Please enter your password")
                    : SizedBox(),
                SizedBox(
                  height: 75,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_email.text.isEmpty) {
                        setState(() {
                          _emailEmpty = true;
                        });
                      }
                      if (_password.text.isEmpty) {
                        setState(() {
                          _passwordEmpty = true;
                        });
                      }
                      if (!_emailEmpty && !_passwordEmpty) {
                        _validateAndSignIn();
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {}, child: Text("New to LetzConnect? ")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => SignupScreen()));
                        },
                        child: Text("Create New Account"))
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
