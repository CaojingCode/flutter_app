
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/base_widget.dart';

import 'article_list_base.dart';

class ArticleListWidget extends BaseWidget {

  @override
  BaseWidgetState<BaseWidget> getState() => ArticleListState();
}

class ArticleListState extends BaseWidgetState<ArticleListWidget> {

  @override
  Widget get appBarWidget => AppBar(title: Text("文章列表"));

  @override
  Widget buildBody() {
    return ArticleListBaseWidget(cid: 0);
  }

  @override
  initData() {
  }
}
