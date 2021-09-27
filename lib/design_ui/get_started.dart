import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/signin.dart';
import 'package:cia_client/design_ui/signup.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter:
                  ColorFilter.mode(Colors.black54, BlendMode.luminosity),
              image: AssetImage(
                "assets/images/intro_background.jpg",
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  "assets/icons/link_new.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: connectTitle,
              ),
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.shade300,
                  //     blurRadius: 1,
                  //     spreadRadius: 1,
                  //     offset: Offset(2.0, 2.0),
                  //   ),
                  // ],
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => SignupScreen()));
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
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.shade300,
                  //     blurRadius: 1,
                  //     spreadRadius: 1,
                  //     offset: Offset(2.0, 2.0),
                  //   ),
                  // ],
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => SigninScreen()));
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
            ],
          ),
        ),
      ),
    );
  }
}
