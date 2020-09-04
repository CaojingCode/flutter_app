import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base_widget.dart';
import 'package:flutter_app/bean/system_screen_bean_entity.dart';
import 'package:flutter_app/http/dioinit.dart';
import 'package:flutter_app/widget/item_page_system.dart';

import 'article_list_base.dart';

class SystemWidget extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() => SystemState();
}

class SystemState extends BaseWidgetState<SystemWidget> {
  List<SystemScreenBeanData> screenList = [];
  List<SystemScreenBeanDatachild> screenChildList = [];
  SystemScreenBeanEntity screenBeanEntity;
  int index = 0;
  int indexChild = 0;
  int cid = 0; //文章分类id

  int pageNum = 0;
  ArticleListBaseWidget articleListBaseWidget;
  final GlobalKey<ArticleListBaseState> key = GlobalKey<ArticleListBaseState>();

  @override
  Widget get appBarWidget => AppBar(title: Text("文章列表"));

  @override
  Widget get endDrawerWidget => drawerSystem();

  @override
  Widget buildBody() {
    return ArticleListBaseWidget(key: key, cid: cid);
  }

  @override
  initData() {
    getSystemScreen();
  }

  Widget drawerSystem() {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
            color: Colors.blue,
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    child: Text("体系数据"),
                    height: kToolbarHeight + MediaQuery.of(context).padding.top,
                    //appbar高度+状态栏高度
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    alignment: Alignment.center,
                    color: Colors.grey[200]),
                Expanded(
                    child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider(
                                      height: 1, color: Colors.grey[50]);
                                },
                                itemBuilder: (context, index) => ItemPageSystem(
                                    screenList[index],
                                    null,
                                    index,
                                    (index) => {onItemClick(index)}),
                                itemCount: screenList.length),
                            color: Colors.white)),
                    Expanded(
                        child: Container(
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider(
                                      height: 1, color: Colors.white);
                                },
                                itemBuilder: (context, index) => ItemPageSystem(
                                    null,
                                    screenChildList[index],
                                    index,
                                    (index) => onItemClickChild(index)),
                                itemCount: screenChildList.length),
                            color: Colors.grey[50]))
                  ],
                ))
              ],
            )));
  }

  getSystemScreen() async {
    //获取体系数据
    Response responseScreen = await dio.get("tree/json");
    setState(() {
      screenBeanEntity = SystemScreenBeanEntity()
          .fromJson(jsonDecode(responseScreen.toString()));
      screenList = screenBeanEntity.data;
      //更新一级文章文类默认选中第一个
      var screenBean = screenList[0];
      screenBean.isSelect = true;
      screenList.fillRange(1, 1, screenBean);

      //根据默认的一级分类获取二级分类的默认数据
      screenChildList = screenList[0].children;
      //更新二级文章文类默认选中第一个的标示
      SystemScreenBeanDatachild screenChildBean = screenChildList[0];
      screenChildBean.isSelect = true;
      screenChildList.fillRange(1, 1, screenChildBean);
      //设置默认的文章分类id。用户获取文章列表
      cid = screenChildBean.id;
    });
  }

  //一级筛选点击事件处理
  onItemClick(int index) {
    setState(() {
      //全局记住点击位置
      this.index = index;
      //设置二级菜单数据集合
      screenChildList = screenList[index].children;
      //遍历一级数据设置一级菜单标示，是否选中
      updateListSelect(index, screenList);
    });
  }

  //二级筛选事件处理
  onItemClickChild(int index) {
    setState(() {
      //全局记住二级菜单点击位置
      indexChild = index;
      //双层循环遍历清空二级菜单为非选中状态
      for (int i = 0; i < screenList.length; i++) {
        updateListSelect(-1, screenList[i].children);
      }
      //重新当前点击数据为选中状态
      updateListSelect(index, screenChildList);
      cid = screenChildList[index].id;
      Navigator.pop(context);
      key.currentState.refreshController.requestRefresh();
    });
  }

  ///更新是否选中数据
  updateListSelect(int index, List list) {
    for (int i = 0; i < list.length; i++) {
      var dataBean = list[i];
      if (index == i) {
        dataBean.isSelect = true;
      } else {
        dataBean.isSelect = false;
      }
      list.fillRange(i, i, dataBean);
    }
  }
}
