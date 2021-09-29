import 'dart:async';

import 'package:cia_client/design_ui/connect_main.dart';
import 'package:cia_client/design_ui/get_started.dart';
import 'package:cia_client/utils/navigation.dart';
import 'package:cia_client/utils/storage_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String userId = '';
  @override
  void initState() {
    StorageManager.readData("userId").then((value) {
      if (value == null || value == "") {
        Timer(Duration(milliseconds: 500), () {
          Go.toWithoutTrail(context, IntroScreen(),
          );
        });
      } else {
        print("value $value");
        Timer(Duration(milliseconds: 500), () {
          Go.toWithoutTrail(context, ConnectMain(),
          );
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              "assets/images/splash_screen.png",
            ),
          ),
        ),
      ),
    );
  }
}
