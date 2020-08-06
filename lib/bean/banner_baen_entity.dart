import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class BannerBaenEntity with JsonConvert<BannerBaenEntity> {
	List<BannerBaenData> data;
	int errorCode;
	String errorMsg;
}

class BannerBaenData with JsonConvert<BannerBaenData> {
	String desc;
	int id;
	String imagePath;
	int isVisible;
	int order;
	String title;
	int type;
	String url;
}
