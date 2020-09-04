import 'dart:async';

import 'package:flutter/material.dart';

import '../bean/banner_baen_entity.dart';
import 'webview_page.dart';

/// 自定义Banner轮播图
class BannerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BannerViewState();

  final List<BannerBaenData> _banners;
  final double height;
  final ValueChanged<int> onTap;
  final Curve curve;

  BannerView(
    this._banners, {
    this.height = 200,
    this.onTap,
    this.curve = Curves.linear,
  }) : assert(_banners != null);
}

class BannerViewState extends State<BannerView> {
  PageController _pageController;
  int _curIndex;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _curIndex = widget._banners.length * 5;
    _pageController = PageController(initialPage: _curIndex,keepPage: false);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[_buildPageView(), _buildIndicator()],
    );
  }

  Widget _buildPageView() {
    var length = widget._banners.length;
    return Container(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _curIndex = index;
            if (index == 0) {
              _curIndex = length;
              _changePage();
            }
          });
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanDown: (details) {
              _cancelTimer();
            },

            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return WebViewPage(widget._banners[index%length].url,widget._banners[index%length].title);
              }));
            },
            child: Image.network(
              widget._banners[index % length].imagePath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildIndicator() {
    var length = widget._banners.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget._banners.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: 8,
                height: 8,
                color: s == widget._banners[_curIndex % length]
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// 点击到图片的时候取消定时任务
  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      _initTimer();
    }
  }

  /// 初始化定时任务
  _initTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 3), (t) {
        _curIndex++;
        if(_pageController.hasClients) {
          _pageController.animateToPage(
            _curIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        }
      });
    }
  }

  /// 切换页面，并刷新小圆点
  _changePage() {
    Timer(Duration(milliseconds: 350), () {
      _pageController.jumpToPage(_curIndex);
    });
  }
}
