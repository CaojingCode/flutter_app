import 'package:flutter/material.dart';
import 'package:flutter_app/bean/system_screen_bean_entity.dart';

class ItemPageSystem extends StatefulWidget {
  SystemScreenBeanData screenDataBean;

  SystemScreenBeanDatachild screenChild;
  final function;
  int index = 0;

  @override
  State<StatefulWidget> createState() {
    return ItemPageSystemState();
  }

  ItemPageSystem(
      this.screenDataBean, this.screenChild, this.index, this.function);
}

class ItemPageSystemState extends State<ItemPageSystem> {
  String name = "";
  Color color;


  @override
  Widget build(BuildContext context) {
    if (widget.screenChild == null) {
      //说明二级菜单没有数据，展示一级菜单数据
      name = widget.screenDataBean.name;
      color = widget.screenDataBean.isSelect ? Colors.grey[300] : Colors.white;
    } else {
      //二级菜单有数据，展示二级菜单
      name = widget.screenChild.name;
      color = widget.screenChild.isSelect ? Colors.grey [300]: Colors.grey[50];
    }
    return FlatButton(
      child: Text(name),
      onPressed: () => {widget.function(widget.index)},
      color: color,
    );
  }
}
