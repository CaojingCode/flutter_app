import 'package:flutter/material.dart';

import 'itempage.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarPageFirstState();
  }
}

class TabBarPageFirstState extends State<TabBarPageFirst>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return new ItemPage();
        },
        itemCount: 20,
      ),
    );
  }

  //通过with AutomaticKeepAliveClientMixin ，然后重写 @override bool get wantKeepAlive => true; ，就可以实不重新构建的效果了
  @override
  bool get wantKeepAlive => true;
}
