import 'package:cached_network_image/cached_network_image.dart';
import 'package:cia_client/design_ui/add_education.dart';
import 'package:cia_client/design_ui/drawer.dart';
import 'package:cia_client/storage_manager.dart';
import 'package:cia_client/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    StorageManager.readData("email").then((value) {
      setState(() {
        email = value;
      });
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
    getEducation();
    super.initState();
  }

  String email = "";
  String username = "";
  String userId = "";
  List education = [];

  Future getEducation() async {
    var _edu = await UserRepository().getEducation();
    print(_edu);
    setState(() {
      education = _edu;
    });
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
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              Container(
                height: 75,
                width: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn.landesa.org/wp-content/uploads/default-user-image.png",
                    placeholder: (context, url) => CupertinoActivityIndicator(),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: Text(
                  username,
                  style: TextStyle(
                    color: primaryColor,
                    letterSpacing: 1.05,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Heigher Education",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Current Working Company (or) Fresher",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Education",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) => AddEducation()));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Add Education",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView.builder(
                    itemCount: education.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education: ${index + 1}",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            education[index]['degree'],
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            education[index]['field'],
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "University: " + education[index]['university'],
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Grade: " + education[index]['grade'],
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            ("Batch: ${education[index]['startYear']} - ${education[index]['endYear']}"),
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Divider(
                            height: 30,
                            thickness: 0.7,
                            color: Colors.black87,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Experience",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Add Experience",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView(
                  children: [
                    Text(
                      "Experience 1:",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Fullstck Developer (or) job roll",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Current Working Company (or) Fresher",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "March 2019 - Present 1 year 7 month Education",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(
                      height: 30,
                      thickness: 0.7,
                      color: Colors.black87,
                    ),
                    Text(
                      "Experience 2:",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Fullstck Developer (or) job roll",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Current Working Company (or) Fresher",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "March 2019 - Present 1 year 7 month Education",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(
                      height: 30,
                      thickness: 0.7,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
