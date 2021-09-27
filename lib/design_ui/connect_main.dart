import 'package:cached_network_image/cached_network_image.dart';
import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectMain extends StatefulWidget {
  const ConnectMain({Key? key}) : super(key: key);

  @override
  _ConnectMainState createState() => _ConnectMainState();
}

class _ConnectMainState extends State<ConnectMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map> data = [
    {
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Sabareeswaran B",
      "created_At": "July 25, 2021",
      "message": {
        "title": "Internship",
        "description": "Started working at Smartchainers pvt. from July, 2021",
      }
    },
    {
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Gopi",
      "created_At": "July 24, 2021",
      "message": {
        "title": "selected as an intern",
        "description":
            "I'm really excited to work for Smartchainers pvt, starting from next week.",
      }
    },
    {
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Sabareeswaran B",
      "created_At": "August 15, 2020",
      "message": {
        "title": "MCA",
        "description":
            "Joined MCA in RVS college one of the best college in Coimbatore also where i did my UG.",
      }
    },
  ];

  Widget postWidget(post) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      constraints: BoxConstraints(
        minHeight: 180,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2.0,
              spreadRadius: 2.0,
            )
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: CachedNetworkImage(
                      imageUrl: post['imageUrl'],
                      placeholder: (context, url) =>
                          CupertinoActivityIndicator(),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      // padding: EdgeInsets.only(top: 5),
                      child: Text(
                        post['username'],
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        post['created_At'],
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                post['message']['title'],
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                post['message']['description'],
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

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
          body: SingleChildScrollView(
            child:
                Column(children: data.map((post) => postWidget(post)).toList()),
          )),
    );
  }
}
