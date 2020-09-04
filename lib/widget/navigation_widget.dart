import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/base_widget.dart';
import 'package:flutter_app/bean/base_bean.dart';
import 'package:flutter_app/bean/navigation_entity_entity.dart';
import 'package:flutter_app/http/dioinit.dart';
import 'package:flutter_app/itempage.dart';
import 'package:flutter_app/utils/utils.dart';

import 'item_navigation.dart';

class NavigationWidget extends BaseWidget {
  @override
  BaseWidgetState getState() => NavigationWidgetState();
}

class NavigationWidgetState extends BaseWidgetState<NavigationWidget> {
  NavigationEntityEntity navigationEntity = NavigationEntityEntity();

  List<NavigationEntityData> navigationList = [];

  @override
  BaseBean get baseBean => navigationEntity;

  @override
  Widget get appBarWidget => AppBar(title: Text("导航"));

  @override
  Widget buildBody() {
    return ListView.builder(
        itemBuilder: (context, index) => ItemNavigation(navigationList[index]),
        itemCount: navigationList.length);
  }

  @override
  initData() {
    getNavigationData();
  }

  getNavigationData() async {
    await dio.get("navi/json").then((value) {
      navigationEntity =
          NavigationEntityEntity().fromJson(jsonDecode(value.toString()));
      navigationList = navigationEntity.data;
      if (navigationList.length == 0) {
        navigationEntity.state = ViewState.empty;
      } else {
        navigationEntity.state = ViewState.idle;
      }
    }).catchError((onError) {
      navigationEntity.state = ViewState.error;
    });
    setState(() {});
  }
}
