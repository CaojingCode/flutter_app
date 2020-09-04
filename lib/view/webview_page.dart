import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../base_widget.dart';

class WebViewPage extends BaseWidget {
  String _urlLink;
  String tittle;

  WebViewPage(this._urlLink, this.tittle);

  @override
  BaseWidgetState<BaseWidget> getState() {
    return WebViewState();
  }
}

class WebViewState extends BaseWidgetState<WebViewPage> {
  bool isLoading = false;
  WebViewController webViewController;

  @override
  Widget get appBarWidget => AppBar(title: Text(widget.tittle));

  @override
  Widget buildBody() => initBody();

  @override
  bool onBackCallBack() {
    webViewController.canGoBack().then((value) {
      if (value) {
        webViewController.goBack();
      } else {
        Navigator.of(context).pop();
      }
    });
    return false;
  }

  Widget initBody() {
    return Stack(children: <Widget>[
      WebView(
        initialUrl: widget._urlLink,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (webViewController) {
          this.webViewController = webViewController;
          setState(() {
            isLoading = true;
          });
        },
        onPageStarted: (url) {
          setState(() {
            isLoading = true;
          });
        },
        onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        },
      ),
      isLoading ? Center(child: CircularProgressIndicator()) : Container()
    ]);
  }

  @override
  initData() {}
}
