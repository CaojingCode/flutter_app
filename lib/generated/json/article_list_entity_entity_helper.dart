import 'package:flutter_app/bean/article_list_entity_entity.dart';
import 'package:flutter_app/bean/top_article_bean_entity.dart';

articleListEntityEntityFromJson(ArticleListEntityEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new ArticleListEntityData().fromJson(json['data']);
	}
	if (json['errorCode'] != null) {
		data.errorCode = json['errorCode']?.toInt();
	}
	if (json['errorMsg'] != null) {
		data.errorMsg = json['errorMsg']?.toString();
	}
	return data;
}

Map<String, dynamic> articleListEntityEntityToJson(ArticleListEntityEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	data['errorCode'] = entity.errorCode;
	data['errorMsg'] = entity.errorMsg;
	return data;
}

articleListEntityDataFromJson(ArticleListEntityData data, Map<String, dynamic> json) {
	if (json['curPage'] != null) {
		data.curPage = json['curPage']?.toInt();
	}
	if (json['datas'] != null) {
		data.datas = new List<TopArticleBeanData>();
		(json['datas'] as List).forEach((v) {
			data.datas.add(new TopArticleBeanData().fromJson(v));
		});
	}
	if (json['offset'] != null) {
		data.offset = json['offset']?.toInt();
	}
	if (json['over'] != null) {
		data.over = json['over'];
	}
	if (json['pageCount'] != null) {
		data.pageCount = json['pageCount']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> articleListEntityDataToJson(ArticleListEntityData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['curPage'] = entity.curPage;
	if (entity.datas != null) {
		data['datas'] =  entity.datas.map((v) => v.toJson()).toList();
	}
	data['offset'] = entity.offset;
	data['over'] = entity.over;
	data['pageCount'] = entity.pageCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}