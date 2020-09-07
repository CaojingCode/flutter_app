import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/bean/banner_baen_entity.dart';
import 'package:flutter_app/bean/base_bean.dart';
import 'package:flutter_app/bean/top_article_bean_entity.dart';
import 'package:flutter_app/http/dioinit.dart';
import 'package:flutter_app/view/BannerView.dart';
import 'package:flutter_app/widget/navigation_widget.dart';
import 'package:flutter_app/widget/system_widget.dart';

import 'base_widget.dart';
import 'bean/banner_baen_entity.dart';
import 'bean/top_article_bean_entity.dart';
import 'itempage.dart';
import 'utils/utils.dart';
import 'widget/article_list_widget.dart';

class TabBarPageFirst extends BaseWidget {
  @override
  BaseWidgetState getState() {
    return TabBarPageFirstState();
  }
}

class TabBarPageFirstState extends BaseWidgetState<TabBarPageFirst> {
  List<BannerBaenData> _banners = [];
  List<TopArticleBeanData> _articles = [];
  TopArticleBeanEntity topArticleBeanEntity = TopArticleBeanEntity();

  final List<String> menus = ["文章", "体系", "导航", "广场"];

  @override
  BaseBean get baseBean => topArticleBeanEntity;

  @override
  Widget buildBody() {
    return updateTopArticles();
  }

  @override
  initData() {
    getBanner();
    getTopArticle();
  }

  ///轮播图
  getBanner() async {
    ///轮播图接口请求
    await dio
        .get("banner/json")
        .then((value) => updateBannerData(value.toString()))
        .catchError((onError) => DefaultAssetBundle.of(context)
            .loadString("assets/banner.json")
            .then((value) => updateBannerData(value.toString())));
  }

  updateBannerData(String jsonStr) {
    ///接口调用成功后更新数据需要调用setState()方法
    setState(() {
      ///轮播图实体解析
      BannerBaenEntity bannerEntity =
          BannerBaenEntity().fromJson(jsonDecode(jsonStr));
      _banners = bannerEntity.data;
    });
  }

  ///置顶文章
  getTopArticle() async {
    ///置顶文章接口请求
    await dio.get("article/top/json").then((value) {
      ///接口调用成功后更新数据需要调用setState()方法
      updateTopArticle(value.toString());
    }).catchError((onError) {
      DefaultAssetBundle.of(context)
          .loadString("assets/top_article.json")
          .then((value) => updateTopArticle(value.toString()));

//      setState(() {
//        topArticleBeanEntity.state = ViewState.error;
//        print("请求失败了:$onError");
//      });
    });
  }

  updateTopArticle(String jsonStr) {
    setState(() {
      ///置顶文章实体解析
      topArticleBeanEntity =
          TopArticleBeanEntity().fromJson(jsonDecode(jsonStr));
      _articles = topArticleBeanEntity.data;
      if (_articles.length == 0) {
        topArticleBeanEntity.state = ViewState.empty;
      } else {
        topArticleBeanEntity.state = ViewState.idle;
      }
    });
  }

  Widget updateBanner() {
    return BannerView(
      _banners,
      curve: Curves.bounceIn,
    );
  }

  Widget updateTopArticles() {
    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(child: updateBanner()),
      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //Grid按两列显示
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1.2,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return InkWell(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.image,
                        color: Colors.green,
                        size: 45,
                      ),
                      Text(menus[index])
                    ]),
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ArticleListWidget();
                    }));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return SystemWidget();
                    }));
                  } else if (index == 2) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return NavigationWidget();
                    }));
                  }
                });
          }, childCount: 4)),
      SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        return ItemPage(_articles[index]);
      }, childCount: _articles.length))
    ]);
  }
}
