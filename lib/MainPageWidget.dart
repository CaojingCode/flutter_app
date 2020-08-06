import 'package:flutter/material.dart';
import 'package:flutter_app/http/dioinit.dart';
import 'package:flutter_app/tabbar_widget.dart';

import 'TabBarPageFirst.dart';
import 'TabBarPageSecond.dart';
import 'TabBarPageThree.dart';

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPageWidget>
    with SingleTickerProviderStateMixin {
  final List<String> tab = ["首页", "项目", "公众号", "问答", "我的"];
  TabController tabController;

  final List<Tab> icons = [
    Tab(text: "首页", icon: Icon(Icons.account_balance)),
    Tab(text: "项目", icon: Icon(Icons.account_balance)),
    Tab(text: "公众号", icon: Icon(Icons.account_balance)),
    Tab(text: "问答", icon: Icon(Icons.account_balance)),
    Tab(text: "我的", icon: Icon(Icons.account_balance))
  ];

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: tab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: _renderPage(),
        controller: tabController,
        //TabBarView 默认支持手势滑动，若要禁止设置 NeverScrollableScrollPhysics
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
            controller: tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(style: BorderStyle.none)),
            tabs: icons),
      ),
    );
  }

  _renderPage() {
    return [
      new TabBarPageFirst(),
      new TabBarPageSecond(),
      new TabBarPageThree(),
      new TabBarPageThree(),
      new TabBarPageThree()
    ];
  }
}
