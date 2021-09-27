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
      "postId": "1001",
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Sabareeswaran B",
      "created_At": "July 25, 2021",
      "message": {
        "title": "Internship",
        "description": "Started working at Smartchainers pvt. from July, 2021",
      },
      "attachments": {
        "type": "",
        "url": "",
      }
    },
    {
      "postId": "1002",
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Gopi",
      "created_At": "July 24, 2021",
      "message": {
        "title": "selected as an intern",
        "description":
            "I'm really excited to work for Smartchainers pvt, starting from next week.",
      },
      "attachments": {
        "type": "",
        "url": "",
      }
    },
    {
      "postId": "1003",
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Sabareeswaran B",
      "created_At": "August 15, 2020",
      "message": {
        "title": "MCA",
        "description":
            "Joined MCA in RVS college one of the best college in Coimbatore also where i did my UG.",
      },
      "attachments": {
        "type": "",
        "url": "",
      }
    },
    {
      "postId": "1004",
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Stalin",
      "created_At": "August 14, 2021",
      "message": {
        "title": "Joining PG",
        "description":
            "At last got a seat in a prestigious college in Coiambatore. Exited to be a part of Rvs collage.",
      },
      "attachments": {
        "type": "",
        "url": "",
      }
    },
    {
      "postId": "1003",
      "imageUrl":
          "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
      "username": "Sabareeswaran B",
      "created_At": "October 17, 2020",
      "message": {
        "title": "Aws in Coursera",
        "description":
            "Just finished my course Aws: Building serverless applications and got my certificate.",
      },
      "attachments": {
        "type": "image",
        "url": "assets/images/certificate.jpeg",
      }
    },
  ];

  List liked = [];

  Widget postWidget(post) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              Spacer(),
              DropdownButton<String>(
                icon: Icon(Icons.more_vert),
                underline: SizedBox(),
                items:
                    <String>['Connect', 'Block', 'Report'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
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
          ),
          SizedBox(height: 15),
          post['attachments']['url'] == ""
              ? SizedBox()
              : Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(minHeight: 100),
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                  child: Image.asset(
                    post['attachments']['url'],
                  ),
                ),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.grey.shade400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (liked.contains(post['postId'])) {
                        liked.remove(post['postId']);
                      } else {
                        liked.add(post['postId']);
                      }
                    });
                  },
                  icon: Icon(liked.contains(post['postId'])
                      ? Icons.thumb_up_alt
                      : Icons.thumb_up_alt_outlined)),
              SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined)),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
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
        body: ListView(
            padding: EdgeInsets.only(bottom: 15),
            children: data.map((post) => postWidget(post)).toList()),
      ),
    );
  }
}
