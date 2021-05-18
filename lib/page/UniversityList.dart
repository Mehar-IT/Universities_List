import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:university_list/page/model/universityCatalog.dart';

import 'webPage.dart';

class UniversityList extends StatefulWidget {
  @override
  _UniversityListState createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  List<University> university;
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    var json = await rootBundle.loadString('assets/universityJson.json');
    var decoded = jsonDecode(json);
    var obj = UniversityCatalog.fromJson(decoded);
    university = obj.university;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return university != null
        ? ListView.builder(
            itemCount: university.length,
            itemBuilder: (context, index) => Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          shape: BoxShape.circle,
                        ),
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          '${university[index].alphaTwoCode}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              '${university[index].name}',
                              style: TextStyle(color: Colors.black),
                              textScaleFactor: 1.3,
                            ),
                            Text('${university[index].country}'),
                            Text('${university[index].domain}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebSite(
                                                  uniname:
                                                      university[index].name,
                                                  website:
                                                      university[index].webPage,
                                                )));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue),
                                      height: 30,
                                      width: 100,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Website',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
