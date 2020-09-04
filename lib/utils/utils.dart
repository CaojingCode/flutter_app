import 'package:flutter/material.dart';
import 'package:flutter_app/bean/base_bean.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ViewState { loading, empty, idle, error }

SharedPreferences _prefs;
//初始化全局信息，会在APP启动时执行
Future init() async {
  _prefs = await SharedPreferences.getInstance();
}

Future saveString(String key, String value) async {
  _prefs.setString(key, value);
}

Future<String> getString(String key) async {
  return _prefs.getString(key);
}

Future clearString() async {
  _prefs.clear();
}

Widget loadingWidget(Widget widget, BaseBean baseBean) {
  if (baseBean.state == ViewState.loading) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.only(top: 30), child: Text("数据加载中。。。。"))
        ]);
  } else if (baseBean.state == ViewState.empty) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30), child: Text("很抱歉！没有数据"))
        ]);
  } else if (baseBean.state == ViewState.error) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30), child: Text("很抱歉！出错了"))
        ]);
  } else {
    return widget;
  }
}
