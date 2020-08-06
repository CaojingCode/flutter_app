import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/banner_baen_entity.dart';
import 'package:flutter_app/bean/top_article_bean_entity.dart';
import 'package:flutter_app/http/dioinit.dart';
import 'package:flutter_app/view/BannerView.dart';

import 'itempage.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarPageFirstState();
  }
}

class TabBarPageFirstState extends State<TabBarPageFirst>
    with AutomaticKeepAliveClientMixin {
  List<String> _images = [];
  List<TopArticleBeanData> _articles=[];

  @override
  // ignore: missing_return
  Future<void> initState()  {
    super.initState();
    getBanner();
    getTopArticle();
  }

  ///轮播图
  getBanner() async {
    ///轮播图接口请求
    Response responseBanner = await dio.get("banner/json");

    ///接口调用成功后更新数据需要调用setState()方法
    setState(() {
      ///轮播图实体解析
      BannerBaenEntity bannerEntity =
          BannerBaenEntity().fromJson(jsonDecode(responseBanner.toString()));
      List<BannerBaenData> bannerData = bannerEntity.data;
      for (int i = 0; i < bannerData.length; i++) {
        _images.add(bannerData[i].imagePath);
      }


    });
  }

  ///置顶文章
  getTopArticle() async {
    ///置顶文章接口请求
    Response responseTopArticle = await dio.get("article/top/json");
    ///接口调用成功后更新数据需要调用setState()方法
    setState(() {
      ///置顶文章实体解析
      TopArticleBeanEntity topArticleBeanEntity = TopArticleBeanEntity()
          .fromJson(jsonDecode(responseTopArticle.toString()));
      _articles= topArticleBeanEntity.data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BannerView(
              _images,
              curve: Curves.bounceIn,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return new ItemPage(_articles[index]);
              },
              itemCount: _articles.length,
            ))
          ],
        ));
  }

  //通过with AutomaticKeepAliveClientMixin ，然后重写 @override bool get wantKeepAlive => true; ，就可以实不重新构建的效果了
  @override
  bool get wantKeepAlive => true;
}
