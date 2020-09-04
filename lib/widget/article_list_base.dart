import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/article_list_entity_entity.dart';
import 'package:flutter_app/bean/top_article_bean_entity.dart';
import 'package:flutter_app/http/dioinit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../itempage.dart';

// ignore: must_be_immutable
class ArticleListBaseWidget extends StatefulWidget {
  int cid = 0; //文章分类的id
  @override
  State<StatefulWidget> createState() {
    return ArticleListBaseState();
  }

  ArticleListBaseWidget({Key key,this.cid}):super(key:key);
}

class ArticleListBaseState extends State<ArticleListBaseWidget> {
  RefreshController refreshController =
      RefreshController(initialRefresh: true);
  int pageNum = 0;
  List<TopArticleBeanData> _articles = [];

  void onRefresh() {
    pageNum = 0;
    getArticle(true, getApiName());
  }

  void loadMore() {
    pageNum++;
    getArticle(false, getApiName());
  }

  String getApiName() {
    String apiName = "";
      if (widget.cid > 0) {
        apiName = "article/list/$pageNum/json?cid=${widget.cid}";
      } else {
        apiName = "article/list/$pageNum/json";
      }
    print("apiName=$apiName");
    return apiName;
  }

  ///置顶文章
  void getArticle(bool isRefresh, String apiName) async {
    ///置顶文章接口请求
    dio.get(apiName).then((value) {
      ///置顶文章实体解析
      ArticleListEntityEntity articleBeanEntity =
          ArticleListEntityEntity().fromJson(jsonDecode(value.toString()));
      if (isRefresh) {
        _articles = articleBeanEntity.data.datas;
      } else {
        _articles.addAll(articleBeanEntity.data.datas);
      }

      ///接口调用成功后更新数据需要调用setState()方法
      setState(() {

      });

      if (articleBeanEntity.data.datas.length ==0) {
        //如果接口没有数据返回
        if (isRefresh) {
          //如果是下拉刷新的时候并且接口没有返回数据，隐藏列表控件，展示空页面
          refreshController.refreshFailed();
        } else {
          //如果是上啦加载更多并且没有返回数据，就展示列表控件，但是下拉提示没有更多数据了
          refreshController.loadNoData();
        }
      } else {
        //如果有数据返回，展示列表控件
        if (isRefresh) {
          //如果是下拉刷新，并且有数据返回正常展示页面数据
          refreshController.refreshCompleted();
        } else {
          //如果是上啦加载，并且有数据返回正常展示页面数据
          refreshController.loadComplete();
        }
      }
    }).catchError((onError) {
      if (isRefresh) {
        //如果下拉刷新，并且接口出错，展示错误页面
        refreshController.refreshFailed();
      } else {
        //如果上拉加载更多，并且接口出错，展示列表控件，底部下拉位置展示加载失败
        refreshController.loadFailed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: onRefresh,
        onLoading: loadMore,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        child:
            ListView.builder(
                itemBuilder: (context, index) => ItemPage(_articles[index]),
                itemCount: _articles.length)
    );
  }
}
