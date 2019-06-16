import 'package:flutter/material.dart';
import 'package:flutter_app/tabbar_widget.dart';

import 'TabBarPageFirst.dart';
import 'TabBarPageSecond.dart';
import 'TabBarPageThree.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  int type;


  TabBarBottomPageWidget(this.type);

  @override
  State<StatefulWidget> createState() {
    return TabBarBottomPageWState(type);
  }
}

class TabBarBottomPageWState extends State<TabBarBottomPageWidget> {
  final PageController topPageControl = new PageController();

  final List<String> tab = ["动态", "趋势", "我的"];
  int type;

  TabBarBottomPageWState(this.type);

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      type: type,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      backgroundColor: Colors.green,
      indicatorColor: Colors.white,
      title: Text("我是标题"),
      topPageControl: topPageControl,
    );
  }

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(
          onPressed: () {
            topPageControl.jumpTo(MediaQuery.of(context).size.width * i);
          },
          child: new Text(
            tab[i],
            maxLines: 1,
            style: TextStyle(color: Colors.white,fontSize: 15.0),
          )));
    }
    return list;
  }

  _renderPage() {
    return [
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
    ];
  }
}
