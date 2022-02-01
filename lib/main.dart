import 'package:cia_client/design_ui/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navState,
      debugShowCheckedModeBanner: false,
      title: 'Letz Connect',
      home: SplashScreen(),      
    );
  }
}
