import 'package:flutter/material.dart';

AppBar myAppbar(bool search, VoidCallback state) {
  return AppBar(
    centerTitle: search,
    title: search
        ? Text('Universities List')
        : TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Enter University Name',
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
                labelText: 'Search for University'),
          ),
    actions: [
      IconButton(
          icon: Icon(
            search ? Icons.search : Icons.cancel,
          ),
          onPressed: () {
            state();
          })
    ],
  );
}
