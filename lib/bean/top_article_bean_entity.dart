import 'package:flutter_app/bean/base_bean.dart';
import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class TopArticleBeanEntity  with JsonConvert<TopArticleBeanEntity> ,BaseBean{
	List<TopArticleBeanData> data;
	int errorCode;
	String errorMsg;
}

class TopArticleBeanData with JsonConvert<TopArticleBeanData> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int realSuperChapterId;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<dynamic> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}
