import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebViewWidget extends StatefulWidget {
  String _urlLink;

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }

  WebViewWidget
      (this._urlLink);
}

class WebViewState extends State<WebViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("标题")) ,
//      body: WebView,
    );
  }

}

