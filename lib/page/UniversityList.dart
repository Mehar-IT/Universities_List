import 'package:flutter/material.dart';
import 'package:university_list/page/model/universityCatalog.dart';
import 'webPage.dart';

class UniversityList extends StatefulWidget {
  final List<University> university;
  UniversityList({this.university});
  @override
  _UniversityListState createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  @override
  Widget build(BuildContext context) {
    return widget.university != null
        ? ListView.builder(
            itemCount: widget.university.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            gradient: LinearGradient(
                                colors: [Colors.cyan, Colors.indigo]),
                            shape: BoxShape.circle,
                          ),
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 1} ${widget.university[index].alphaTwoCode}',
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
                                '${widget.university[index].name}',
                                style: TextStyle(color: Colors.black),
                                textScaleFactor: 1.3,
                              ),
                              Text('${widget.university[index].country}'),
                              Text('${widget.university[index].domain}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WebSite(
                                                    uniname: widget
                                                        .university[index].name,
                                                    website: widget
                                                        .university[index]
                                                        .webPage,
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
                  ),
                ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
