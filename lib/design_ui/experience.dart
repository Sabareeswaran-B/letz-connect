import 'package:cia_client/utils/model.dart';
import 'package:cia_client/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';
import '../utils/user_repository.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  void initState() {
    getExperience();
    super.initState();
  }

  List<Experience> experience = [];

  Future getExperience() async {
    var _exp = await UserRepository().getExperience();
    print(_exp);
    setState(() {
      experience = _exp.map<Experience>((e) => Experience.fromJson(e)).toList();
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
          title: Text("Experience"),
        ),
        body: experience.isEmpty
            ? Center(child: CircularProgressIndicator(color: primaryColor))
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: experience.length,
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
                          "Experience: ${index + 1}",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                            height: 10, thickness: 0.7, color: Colors.black),
                        SizedBox(height: 10),
                        content("Job Roll", experience[index].jobroll,
                            FontAwesomeIcons.briefcase),
                        divider,
                        content("Company name", experience[index].companyname,
                            FontAwesomeIcons.building),
                        divider,
                        content("Stated year", experience[index].started,
                            FontAwesomeIcons.calendarAlt),
                        divider,
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
