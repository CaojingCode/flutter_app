import 'package:flutter_app/bean/base_bean.dart';
import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class SystemScreenBeanEntity with JsonConvert<SystemScreenBeanEntity> ,BaseBean{
	List<SystemScreenBeanData> data;
	int errorCode;
	String errorMsg;
}

class SystemScreenBeanData with JsonConvert<SystemScreenBeanData> {
	List<SystemScreenBeanDatachild> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
	bool isSelect=false;
}

class SystemScreenBeanDatachild with JsonConvert<SystemScreenBeanDatachild> {
	List<dynamic> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
	bool isSelect=false;
}
