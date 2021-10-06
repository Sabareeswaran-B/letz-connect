import 'dart:async';

import 'package:cia_client/design_ui/profile.dart';
import 'package:cia_client/utils/navigation.dart';
import 'package:cia_client/utils/user_repository.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({Key? key}) : super(key: key);

  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  final TextEditingController university = TextEditingController();
  final TextEditingController degree = TextEditingController();
  final TextEditingController field = TextEditingController();
  final TextEditingController grade = TextEditingController();
  final TextEditingController activities = TextEditingController();
  final TextEditingController startYear = TextEditingController();
  final TextEditingController endYear = TextEditingController();
  final TextEditingController description = TextEditingController();

  DateTime _startYear = DateTime.now();
  DateTime _endYear = DateTime.now();

  void _submit() async {
    Map data = {
      "university": university.text,
      "degree": degree.text,
      "field": field.text,
      "grade": grade.text,
      "activities": activities.text,
      "startYear": startYear.text,
      "endYear": endYear.text,
      "description": description.text,
    };
    var res = await UserRepository().addEducation(data);
    print("user $res");
    if (res != null) {
      Timer(Duration(milliseconds: 500), () {
        Go.toWithoutTrail(context, ProfileScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Go.back(context);
          },
          icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
        ),
        centerTitle: true,
        title: Text("Add Education"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Institution/University"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: university,
                decoration: InputDecoration(
                  hintText: 'Institution/University',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Degree"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: degree,
                decoration: InputDecoration(
                  hintText: 'Degree (eg: MCA)',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Field of study"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: field,
                decoration: InputDecoration(
                  hintText: 'Field of study (eg: Computer Science)',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Grade"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: grade,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Grade (eg : 85)',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Activities and Societies"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: activities,
                decoration: InputDecoration(
                  hintText: 'Activities and Societies',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("Start Year"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("End Year"),
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.black, width: 0.5),
                      color: backgroundColor,
                    ),
                    child: TextFormField(
                      controller: startYear,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Start Year',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        suffixIcon: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Select Year"),
                                  content: Container(
                                    width: 300,
                                    height: 300,
                                    child: YearPicker(
                                      firstDate: DateTime(
                                          DateTime.now().year - 100, 1),
                                      lastDate: DateTime(
                                          DateTime.now().year + 100, 1),
                                      initialDate: DateTime.now(),
                                      selectedDate: _startYear,
                                      onChanged: (DateTime dateTime) {
                                        setState(() {
                                          startYear.text =
                                              dateTime.year.toString();
                                        });
                                        Go.back(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(color: Colors.black, width: 0.5),
                      color: backgroundColor,
                    ),
                    child: TextFormField(
                      controller: endYear,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'End Year',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Select Year"),
                                  content: Container(
                                    width: 300,
                                    height: 300,
                                    child: YearPicker(
                                      firstDate: DateTime(
                                          DateTime.now().year - 100, 1),
                                      lastDate: DateTime(
                                          DateTime.now().year + 100, 1),
                                      initialDate: DateTime.now(),
                                      selectedDate: _endYear,
                                      onChanged: (DateTime dateTime) {
                                        setState(() {
                                          endYear.text =
                                              dateTime.year.toString();
                                        });
                                        Go.back(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ]),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Description"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: description,
                maxLines: 4,
                maxLength: 250,
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
                cursorColor: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  _submit();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
