import 'dart:async';

import 'package:cia_client/design_ui/profile.dart';
import 'package:cia_client/utils/navigation.dart';
import 'package:cia_client/utils/user_repository.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({Key? key}) : super(key: key);

  @override
  _AddExperienceState createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  final TextEditingController roll = TextEditingController();
  final TextEditingController companyname = TextEditingController();
  final TextEditingController startYear = TextEditingController();

  DateTime _startYear = DateTime.now();

  void _submit() async {
    Map data = {
      "jobroll": roll.text,
      "companyname": companyname.text,
      "started": startYear.text,
    };
    var res = await UserRepository().addExperience(data);
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
          title: Text("Add Experience"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Job Roll"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(color: Colors.black, width: 0.5),
                  color: backgroundColor,
                ),
                child: TextFormField(
                  controller: roll,
                  decoration: InputDecoration(
                    hintText: 'Job Roll',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Company Name"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(color: Colors.black, width: 0.5),
                  color: backgroundColor,
                ),
                child: TextFormField(
                  controller: companyname,
                  decoration: InputDecoration(
                    hintText: 'Company Name',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Started Year"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(color: Colors.black, width: 0.5),
                  color: backgroundColor,
                ),
                child: TextFormField(
                  controller: startYear,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Started Year',
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
                                  firstDate:
                                      DateTime(DateTime.now().year - 100, 1),
                                  lastDate:
                                      DateTime(DateTime.now().year + 100, 1),
                                  initialDate: DateTime.now(),
                                  selectedDate: _startYear,
                                  onChanged: (DateTime dateTime) {
                                    setState(() {
                                      startYear.text = dateTime.year.toString();
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
      ),
    );
  }
}
