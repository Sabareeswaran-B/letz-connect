import 'package:cia_client/utils/model.dart';
import 'package:cia_client/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';
import '../utils/user_repository.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  void initState() {
    getEducation();
    super.initState();
  }

  List<Education> education = [];

  Future getEducation() async {
    var _edu = await UserRepository().getEducation();
    print(_edu);
    setState(() {
      education =
          _edu.map<Education>((json) => Education.fromJson(json)).toList();
    });
  }

  Widget content(String title, String subtitle, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 50,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      trailing: CircleAvatar(
        backgroundColor: primaryColor,
        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }

  Widget divider =
      Divider(height: 15, thickness: 0.7, color: Colors.grey.shade400);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              // _scaffoldKey.currentState!.openDrawer();
              Go.back(context);
            },
            icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
          ),
          centerTitle: true,
          title: Text("Education"),
        ),
        body: education.isEmpty
            ? Center(
                child: Text(
                "No Education added yet",
                style: TextStyle(color: Colors.grey),
              ))
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: education.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 5,
                          // offset: Offset(5.0, 5.0),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Education: ${index + 1}",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                            height: 10, thickness: 0.7, color: Colors.black),
                        SizedBox(height: 10),
                        content(
                            "Institution/University",
                            education[index].university,
                            FontAwesomeIcons.university),
                        divider,
                        content("Degree", education[index].degree,
                            FontAwesomeIcons.userGraduate),
                        divider,
                        content("Field of study", education[index].field,
                            FontAwesomeIcons.bookOpen),
                        divider,
                        content("Grade", education[index].grade,
                            FontAwesomeIcons.percentage),
                        divider,
                        content(
                            "Batch",
                            "${education[index].startYear} - ${education[index].endYear}",
                            FontAwesomeIcons.calendarAlt),
                        divider,
                        content("Activities", education[index].activities,
                            FontAwesomeIcons.running),
                        divider,
                        content("Desctiption", education[index].description,
                            FontAwesomeIcons.penAlt),
                        divider,
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
