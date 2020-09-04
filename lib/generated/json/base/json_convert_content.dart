// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_app/bean/top_article_bean_entity.dart';
import 'package:flutter_app/generated/json/top_article_bean_entity_helper.dart';
import 'package:flutter_app/bean/article_list_entity_entity.dart';
import 'package:flutter_app/generated/json/article_list_entity_entity_helper.dart';
import 'package:flutter_app/bean/system_screen_bean_entity.dart';
import 'package:flutter_app/generated/json/system_screen_bean_entity_helper.dart';
import 'package:flutter_app/bean/navigation_entity_entity.dart';
import 'package:flutter_app/generated/json/navigation_entity_entity_helper.dart';
import 'package:flutter_app/bean/banner_baen_entity.dart';
import 'package:flutter_app/generated/json/banner_baen_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case TopArticleBeanEntity:
			return topArticleBeanEntityFromJson(data as TopArticleBeanEntity, json) as T;			case TopArticleBeanData:
			return topArticleBeanDataFromJson(data as TopArticleBeanData, json) as T;			case ArticleListEntityEntity:
			return articleListEntityEntityFromJson(data as ArticleListEntityEntity, json) as T;			case ArticleListEntityData:
			return articleListEntityDataFromJson(data as ArticleListEntityData, json) as T;			case SystemScreenBeanEntity:
			return systemScreenBeanEntityFromJson(data as SystemScreenBeanEntity, json) as T;			case SystemScreenBeanData:
			return systemScreenBeanDataFromJson(data as SystemScreenBeanData, json) as T;			case SystemScreenBeanDatachild:
			return systemScreenBeanDatachildFromJson(data as SystemScreenBeanDatachild, json) as T;			case NavigationEntityEntity:
			return navigationEntityEntityFromJson(data as NavigationEntityEntity, json) as T;			case NavigationEntityData:
			return navigationEntityDataFromJson(data as NavigationEntityData, json) as T;			case NavigationEntityDataArticle:
			return navigationEntityDataArticleFromJson(data as NavigationEntityDataArticle, json) as T;			case BannerBaenEntity:
			return bannerBaenEntityFromJson(data as BannerBaenEntity, json) as T;			case BannerBaenData:
			return bannerBaenDataFromJson(data as BannerBaenData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case TopArticleBeanEntity:
			return topArticleBeanEntityToJson(data as TopArticleBeanEntity);			case TopArticleBeanData:
			return topArticleBeanDataToJson(data as TopArticleBeanData);			case ArticleListEntityEntity:
			return articleListEntityEntityToJson(data as ArticleListEntityEntity);			case ArticleListEntityData:
			return articleListEntityDataToJson(data as ArticleListEntityData);			case SystemScreenBeanEntity:
			return systemScreenBeanEntityToJson(data as SystemScreenBeanEntity);			case SystemScreenBeanData:
			return systemScreenBeanDataToJson(data as SystemScreenBeanData);			case SystemScreenBeanDatachild:
			return systemScreenBeanDatachildToJson(data as SystemScreenBeanDatachild);			case NavigationEntityEntity:
			return navigationEntityEntityToJson(data as NavigationEntityEntity);			case NavigationEntityData:
			return navigationEntityDataToJson(data as NavigationEntityData);			case NavigationEntityDataArticle:
			return navigationEntityDataArticleToJson(data as NavigationEntityDataArticle);			case BannerBaenEntity:
			return bannerBaenEntityToJson(data as BannerBaenEntity);			case BannerBaenData:
			return bannerBaenDataToJson(data as BannerBaenData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'TopArticleBeanEntity':
			return TopArticleBeanEntity().fromJson(json);			case 'TopArticleBeanData':
			return TopArticleBeanData().fromJson(json);			case 'ArticleListEntityEntity':
			return ArticleListEntityEntity().fromJson(json);			case 'ArticleListEntityData':
			return ArticleListEntityData().fromJson(json);			case 'SystemScreenBeanEntity':
			return SystemScreenBeanEntity().fromJson(json);			case 'SystemScreenBeanData':
			return SystemScreenBeanData().fromJson(json);			case 'SystemScreenBeanDatachild':
			return SystemScreenBeanDatachild().fromJson(json);			case 'NavigationEntityEntity':
			return NavigationEntityEntity().fromJson(json);			case 'NavigationEntityData':
			return NavigationEntityData().fromJson(json);			case 'NavigationEntityDataArticle':
			return NavigationEntityDataArticle().fromJson(json);			case 'BannerBaenEntity':
			return BannerBaenEntity().fromJson(json);			case 'BannerBaenData':
			return BannerBaenData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'TopArticleBeanEntity':
			return List<TopArticleBeanEntity>();			case 'TopArticleBeanData':
			return List<TopArticleBeanData>();			case 'ArticleListEntityEntity':
			return List<ArticleListEntityEntity>();			case 'ArticleListEntityData':
			return List<ArticleListEntityData>();			case 'SystemScreenBeanEntity':
			return List<SystemScreenBeanEntity>();			case 'SystemScreenBeanData':
			return List<SystemScreenBeanData>();			case 'SystemScreenBeanDatachild':
			return List<SystemScreenBeanDatachild>();			case 'NavigationEntityEntity':
			return List<NavigationEntityEntity>();			case 'NavigationEntityData':
			return List<NavigationEntityData>();			case 'NavigationEntityDataArticle':
			return List<NavigationEntityDataArticle>();			case 'BannerBaenEntity':
			return List<BannerBaenEntity>();			case 'BannerBaenData':
			return List<BannerBaenData>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}