import 'package:flutter/material.dart';
import 'package:flutter_app/bean/navigation_entity_entity.dart';
import 'package:flutter_app/view/webview_page.dart';

class ItemNavigation extends StatefulWidget {
  NavigationEntityData navigationData;

  @override
  State<StatefulWidget> createState() => ItemNavigationState();

  ItemNavigation(this.navigationData);
}

class ItemNavigationState extends State<ItemNavigation> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
        child: Column(
          children: <Widget>[
            Text(widget.navigationData.name,
                style: TextStyle(fontSize: 20, height: 2)),
            GridView.builder(
                //将所有子控件在父控件中填满
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                //解决ListView嵌套GridView滑动冲突问题
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //每行几列
                    childAspectRatio: 3),
                itemCount: widget.navigationData.articles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      semanticContainer: true,
                      child: Text(
                        widget.navigationData.articles[index].title,
                        style: TextStyle(color: Colors.white),
                        softWrap: true,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      color: Colors.lightBlue,
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return WebViewPage(widget.navigationData.articles[index].link,widget.navigationData.articles[index].title);
                      }));
                    },
                  );
                })
          ],
        ));
  }
}
