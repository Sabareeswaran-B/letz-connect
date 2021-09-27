import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

final backgroundColor = Colors.grey.shade100;

final primaryColor = Color(0xff7f7edc);

const String USER = "userData";

final Widget connectTitle = Container(
  child: Text(
    "Letz Connect",
    style: TextStyle(
      color: primaryColor,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
);
