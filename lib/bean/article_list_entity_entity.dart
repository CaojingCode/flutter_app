import 'package:flutter_app/bean/top_article_bean_entity.dart';
import 'package:flutter_app/generated/json/base/json_convert_content.dart';

import 'base_bean.dart';

class ArticleListEntityEntity with JsonConvert<ArticleListEntityEntity>,BaseBean{
	ArticleListEntityData data;
	int errorCode;
	String errorMsg;
}

class ArticleListEntityData with JsonConvert<ArticleListEntityData> {
	int curPage;
	List<TopArticleBeanData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

//class ArticleListEntityDataData with JsonConvert<ArticleListEntityDataData> {
//	String apkLink;
//	int audit;
//	String author;
//	bool canEdit;
//	int chapterId;
//	String chapterName;
//	bool collect;
//	int courseId;
//	String desc;
//	String descMd;
//	String envelopePic;
//	bool fresh;
//	int id;
//	String link;
//	String niceDate;
//	String niceShareDate;
//	String origin;
//	String prefix;
//	String projectLink;
//	int publishTime;
//	int realSuperChapterId;
//	int selfVisible;
//	int shareDate;
//	String shareUser;
//	int superChapterId;
//	String superChapterName;
//	List<dynamic> tags;
//	String title;
//	int type;
//	int userId;
//	int visible;
//	int zan;
//}
