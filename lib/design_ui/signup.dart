import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/connect_main.dart';
import 'package:cia_client/design_ui/signin.dart';
import 'package:cia_client/user_repository.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cPassword = TextEditingController();
  bool _obscureTextPassword = true;
  bool _obscureTextCPassword = true;

  bool _emailError = false;
  bool _passwordError = false;
  bool _cPasswordError = false;
  bool _userNameEmpty = false;
  bool _emailEmpty = false;
  bool _passwordEmpty = false;
  bool _cPasswordEmpty = false;

  void _validateAndSignUp() async {
    if (!_email.text.contains("@")) {
      _emailError = true;
    }
    if (!_emailError && !_passwordError && !_cPasswordError) {
      var user = await UserRepository()
          .signup(_userName.text, _email.text, _password.text);
      if (user['success'] == true) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (builder) => ConnectMain()));
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
          title: Text("Sign up"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: connectTitle,
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Username"),
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
                          _userNameEmpty = false;
                        });
                      },
                      controller: _userName,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15),
                      ),
                      cursorColor: Colors.black,
                    )),
                _userNameEmpty
                    ? _errormsg("*Please enter your userName")
                    : SizedBox(),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email ID"),
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
                    ? _errormsg("*Invalid Email! Please check your email")
                    : SizedBox(),
                _emailEmpty
                    ? _errormsg("*Please enter your email")
                    : SizedBox(),
                SizedBox(height: 10),
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
                    ? _errormsg(
                        "*Password not matching! Please check your password")
                    : SizedBox(),
                _passwordEmpty
                    ? _errormsg("*Please enter your password")
                    : SizedBox(),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Confirm Password"),
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
                      obscureText: _obscureTextCPassword,
                      onChanged: (value) {
                        setState(() {
                          _cPasswordEmpty = false;
                          _cPasswordError = false;
                        });
                      },
                      controller: _cPassword,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _obscureTextCPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _obscureTextPassword
                                  ? Colors.grey.shade400
                                  : primaryColor),
                          onPressed: () {
                            setState(() =>
                                _obscureTextCPassword = !_obscureTextCPassword);
                          },
                        ),
                      ),
                      cursorColor: Colors.black,
                    )),
                _cPasswordError
                    ? _errormsg(
                        "*Password not matching! Please check your password")
                    : SizedBox(),
                _cPasswordEmpty
                    ? _errormsg("*Please confirm your password")
                    : SizedBox(),
                SizedBox(height: 25),
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
                      if (_userName.text.isEmpty) {
                        setState(() {
                          _userNameEmpty = true;
                        });
                      }
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
                      if (_cPassword.text.isEmpty) {
                        setState(() {
                          _cPasswordEmpty = true;
                        });
                      }
                      if (_password.text != _cPassword.text) {
                        setState(() {
                          _passwordError = true;
                          _cPasswordError = true;
                        });
                      }
                      if (!_userNameEmpty &&
                          !_emailEmpty &&
                          !_passwordEmpty &&
                          !_cPasswordEmpty) {
                        _validateAndSignUp();
                      }
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "By continuing, I aggree to LetzConnect Terms of service and Privacy policy.",
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text("Already have an account? ")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (builder) => SigninScreen()));
                        },
                        child: Text("Login"))
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
