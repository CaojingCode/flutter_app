import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemPageState();
  }
}

class ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //卡片包装
      child: new Card(
        margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
          child: FlatButton(
              onPressed: _itemClick,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //文本描述
                    Container(
                        child: Text("我是 Flutter 哈哈哈！！！",
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis),
                        margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                    Padding(padding: EdgeInsets.all(10.0)),
                    //3个平均分配的图标文字
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _getBottomItem(Icons.star, "点赞"),
                        _getBottomItem(Icons.link, "链接"),
                        _getBottomItem(Icons.subway, "地铁")
                      ],
                    )
                  ],
                ),
              ))),
    );
  }

  void _itemClick() {
    print("点击了哈哈哈！！！");
  }

  _getBottomItem(IconData icon, String text) {
    //充满row横向布局
    return Expanded(
      flex: 1,
      //居中显示
      child: Center(
        child: Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,
          //大小按照最大充满
          mainAxisSize: MainAxisSize.max,
          //竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ///一个图标，大小16.0，灰色
            Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
            Padding(padding: EdgeInsets.only(left: 5.0)),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
