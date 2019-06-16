import 'package:flutter/material.dart';

import 'itempage.dart';

class NewPage extends StatefulWidget {
  var _num;

  NewPage(this._num);

  @override
  State<StatefulWidget> createState() {
    return NewPageState(_num);
  }
}

class NewPageState extends State<NewPage> {
  var _num;

  NewPageState(this._num);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("第二个页面"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return new ItemPage();
        },
        itemCount: _num,
      ),
    );
  }
}
