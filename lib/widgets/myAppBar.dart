import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged onchanged;
  final VoidCallback state;

  const MyAppBar({this.onchanged, this.state});

  @override
  _MyAppBarState createState() => _MyAppBarState();
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  bool search = true;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: search,
      title: search
          ? Text('Universities List')
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: widget.onchanged,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter University name',
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
      actions: [
        IconButton(
            icon: Icon(
              search ? Icons.search : Icons.cancel,
            ),
            onPressed: () {
              setState(() {
                widget.state();
                search = !search;
              });
            })
      ],
    );
  }
}
