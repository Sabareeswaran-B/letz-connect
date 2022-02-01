import 'package:cia_client/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../constant.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({Key? key}) : super(key: key);

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  TextEditingController _skills = TextEditingController();

  void submitHandler(value) async {
    if (value != "") {
      setState(() {
        // selectedTags.add(value);
        // selectedTags = selectedTags.toSet().toList();
        // _items =
        //     selectedTags.map((tags) => MultiSelectItem(tags, tags)).toList();
      });
    } else {
      return null;
    }
  }

  var _items;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Go.back(context);
          },
          icon: Icon(Icons.chevron_left, color: Colors.white, size: 30),
        ),
        centerTitle: true,
        title: Text("Add Skills"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.black, width: 0.5),
                color: backgroundColor,
              ),
              child: TextFormField(
                controller: _skills,
                decoration: InputDecoration(
                  labelText: "Add skills",
                  // labelStyle: TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                  suffixIcon: IconButton(
                    icon: Icon(FontAwesomeIcons.plusCircle),
                    onPressed: () {
                      _skills.clear();
                    },
                  ),
                ),
                cursorColor: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: MultiSelectChipDisplay(
                // height: 100,
                chipColor: primaryColor,
                textStyle: TextStyle(color: Colors.white),
                scroll: true,
                items: _items,
                onTap: (value) {
                  setState(() {
                    // selectedTags.remove(value);
                    // _items = selectedTags
                    //     .map((tags) => MultiSelectItem(tags, tags))
                    //     .toList();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
