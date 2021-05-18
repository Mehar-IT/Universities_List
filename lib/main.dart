import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:university_list/widgets/myAppBar.dart';
import 'page/UniversityList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool search = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Universities List',
        home: Scaffold(
          appBar: MyAppBar.myAppbar(search, () {
            setState(() {
              search = !search;
            });
          }),
          body: UniversityList(),
        ));
  }
}
