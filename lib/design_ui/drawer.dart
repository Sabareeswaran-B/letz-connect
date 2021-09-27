import 'package:cached_network_image/cached_network_image.dart';
// ignore: unused_import
import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/connect_main.dart';
import 'package:cia_client/design_ui/get_started.dart';
import 'package:cia_client/design_ui/profile.dart';
import 'package:cia_client/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  void initState() {
    StorageManager.readData("email").then((value) {
      setState(() {
        email = value;
      });
      print(value);
    });
    StorageManager.readData("username").then((value) {
      setState(() {
        username = value;
      });
    });
    StorageManager.readData("userId").then((value) {
      setState(() {
        userId = value;
      });
    });
    super.initState();
  }

  String email = "";
  String username = "";
  String userId = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 25, 15, 5),
              margin: EdgeInsets.only(bottom: 25),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.colorBurn),
                  image: AssetImage("assets/images/drawer_background.jpg"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => ProfileScreen()));
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 75,
                        width: 75,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
                            placeholder: (context, url) =>
                                CupertinoActivityIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => ProfileScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => ConnectMain()));
                    },
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.menu_book),
                    title: Text("Education & Carear"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.work),
                    title: Text("Experience"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.connect_without_contact),
                    title: Text("Connect to people"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.connect_without_contact_outlined),
                    title: Text("My Connectionz"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.person),
                    title: Text("Share Profile"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () async {
                      await StorageManager.clear();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => IntroScreen(),
                        ),
                      );
                    },
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
