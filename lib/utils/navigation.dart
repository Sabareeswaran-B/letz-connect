import 'package:flutter/material.dart';

class Go {
  static to(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => page,
      ),
    );
  }

  static toWithoutTrail(BuildContext context, Widget page) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (builder) => page,
        ),
        (route) => false);
  }

  static back(BuildContext context) {
    return Navigator.pop(context);
  }
}
