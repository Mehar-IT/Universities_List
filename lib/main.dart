import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
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
          appBar: MyAppBar(
            onchanged: onchanged,
            state: () {
              onchanged('');
            },
          ),
          body: UniversityList(
            university: university,
          ),
        ));
  }

  void onchanged(dynamic query) {
    setState(() {
      university = data.where((element) {
        final titleLower = element.name.toLowerCase();
        final authorLower = element.country.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    });
  }
}
