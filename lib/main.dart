import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:university_list/widgets/myAppBar.dart';

import 'page/UniversityList.dart';
import 'page/model/universityCatalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<University> university;
  List<University> data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var json = await rootBundle.loadString('assets/universityJson.json');
    var decoded = jsonDecode(json);
    var obj = UniversityCatalog.fromJson(decoded);
    data = obj.university;
    university = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Universities List',
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatAction(university: university),
        appBar: MyAppBar(
          onchanged: onchanged,
          state: () {
            onchanged('');
          },
        ),
        body: UniversityList(
          university: university,
        ),
      ),
    );
  }

  void onchanged(dynamic query) {
    setState(() {
      university = data.where((university) {
        final name = university.name.toLowerCase();
        final country = university.country.toLowerCase();
        final code = university.alphaTwoCode?.toLowerCase().toString();
        final searchLower = query.toLowerCase();

        return name.contains(searchLower) ||
            code.contains(searchLower) ||
            country.contains(searchLower);
        // (code.contains(searchLower);
      }).toList();
    });
  }
}

class FloatAction extends StatelessWidget {
  final List<University> university;
  const FloatAction({
    Key key,
    @required this.university,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return university != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      colors: [Colors.lightBlueAccent, Colors.cyan])),
              child: ListTile(
                leading: Text(
                  'Total Universities',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  '${university.length}',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        : Stack();
    // : Center(child: CircularProgressIndicator());
  }
}
