import 'package:flutter_app/bean/base_bean.dart';
import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class NavigationEntityEntity with JsonConvert<NavigationEntityEntity> ,BaseBean{
	List<NavigationEntityData> data;
	int errorCode;
	String errorMsg;
}

class NavigationEntityData with JsonConvert<NavigationEntityData> {
	List<NavigationEntityDataArticle> articles;
	int cid;
	String name;
}

class NavigationEntityDataArticle with JsonConvert<NavigationEntityDataArticle> {
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
