import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/drawer.dart';
import 'package:flutter/material.dart';

class ConnectMain extends StatefulWidget {
  const ConnectMain({Key? key}) : super(key: key);

  @override
  _ConnectMainState createState() => _ConnectMainState();
}

class _ConnectMainState extends State<ConnectMain> {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu, color: Colors.white, size: 30),
          ),
          centerTitle: true,
          title: Text("Letz Connect"),
        ),
      ),
    );
  }
}
