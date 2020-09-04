import 'package:flutter_app/bean/system_screen_bean_entity.dart';
import 'package:flutter_app/bean/base_bean.dart';

systemScreenBeanEntityFromJson(SystemScreenBeanEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<SystemScreenBeanData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new SystemScreenBeanData().fromJson(v));
		});
	}
	if (json['errorCode'] != null) {
		data.errorCode = json['errorCode']?.toInt();
	}
	if (json['errorMsg'] != null) {
		data.errorMsg = json['errorMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> systemScreenBeanEntityToJson(SystemScreenBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['errorCode'] = entity.errorCode;
	data['errorMsg'] = entity.errorMsg;
	return data;
}

systemScreenBeanDataFromJson(SystemScreenBeanData data, Map<String, dynamic> json) {
	if (json['children'] != null) {
		data.children = new List<SystemScreenBeanDatachild>();
		(json['children'] as List).forEach((v) {
			data.children.add(new SystemScreenBeanDatachild().fromJson(v));
		});
	}
	if (json['courseId'] != null) {
		data.courseId = json['courseId']?.toInt();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['parentChapterId'] != null) {
		data.parentChapterId = json['parentChapterId']?.toInt();
	}
	if (json['userControlSetTop'] != null) {
		data.userControlSetTop = json['userControlSetTop'];
	}
	if (json['visible'] != null) {
		data.visible = json['visible']?.toInt();
	}
	if (json['isSelect=false'] != null) {
		data.isSelect = json['isSelect=false'];
	}
	return data;
}

Map<String, dynamic> systemScreenBeanDataToJson(SystemScreenBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.children != null) {
		data['children'] =  entity.children.map((v) => v.toJson()).toList();
	}
	data['courseId'] = entity.courseId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	data['isSelect=false'] = entity.isSelect=false;
	return data;
}

systemScreenBeanDatachildFromJson(SystemScreenBeanDatachild data, Map<String, dynamic> json) {
	if (json['children'] != null) {
		data.children = new List<dynamic>();
		data.children.addAll(json['children']);
	}
	if (json['courseId'] != null) {
		data.courseId = json['courseId']?.toInt();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['parentChapterId'] != null) {
		data.parentChapterId = json['parentChapterId']?.toInt();
	}
	if (json['userControlSetTop'] != null) {
		data.userControlSetTop = json['userControlSetTop'];
	}
	if (json['visible'] != null) {
		data.visible = json['visible']?.toInt();
	}
	if (json['isSelect=false'] != null) {
		data.isSelect = json['isSelect=false'];
	}
	return data;
}

Map<String, dynamic> systemScreenBeanDatachildToJson(SystemScreenBeanDatachild entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.children != null) {
		data['children'] =  [];
	}
	data['courseId'] = entity.courseId;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['order'] = entity.order;
	data['parentChapterId'] = entity.parentChapterId;
	data['userControlSetTop'] = entity.userControlSetTop;
	data['visible'] = entity.visible;
	data['isSelect=false'] = entity.isSelect=false;
	return data;
}