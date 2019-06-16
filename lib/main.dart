import 'package:flutter/material.dart';
import 'package:flutter_app/tabbar_widget.dart';

import 'TabBarBottomPageWidget.dart';
import 'newpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MainPage("首页"));
  }
}

class MainPage extends StatelessWidget {
  String tittle;

  MainPage(this.tittle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tittle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 100.0, top: 0.0, right: 100.0, bottom: 0.0),
              child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TabBarBottomPageWidget(TabBarWidget.TOP_TAB);
                    }));
                  },
                  color: Colors.blue,
                  child: Text("顶部导航栏")),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 100.0, top: 20.0, right: 100.0, bottom: 0.0),
              child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TabBarBottomPageWidget(TabBarWidget.BOTTOM_TAB);
                    }));
                  },
                  color: Colors.blue,
                  child: Text("底部导航栏")),
            ),
          ],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _jumpNewPage() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      //跳转到新页面
      return NewPage(_counter);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
                onPressed: _jumpNewPage,
                child: Text(
                  '跳转到新页面',
                  style: Theme.of(context).textTheme.display1,
                )),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 120.0,
              width: 500.0,
              decoration: BoxDecoration(
                //弧度为4.0
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                //设置了decoration的color，就不能设置Container的color。
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 0.3),
              ),
              child: Center(
                child: Text(_counter.toString(),
                    style: Theme.of(context).textTheme.display1),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_counter.toString(),
                      style: Theme.of(context).textTheme.display4),
                  flex: 1,
                ),
                Expanded(
                    child: Text(_counter.toString(),
                        style: Theme.of(context).textTheme.display4))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
