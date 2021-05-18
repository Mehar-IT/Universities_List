import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSite extends StatefulWidget {
  final String website, uniname;
  WebSite({this.website, this.uniname});

  @override
  _WebSiteState createState() => _WebSiteState();
}

class _WebSiteState extends State<WebSite> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.uniname}'),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.website,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isloading = false;
              });
            },
          ),
          isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack()
        ],
      ),
    );
  }
}
