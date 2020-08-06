
import 'package:dio/dio.dart';

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = BaseOptions(
  baseUrl: "https://www.wanandroid.com/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
) ;

Dio dio=Dio(options);

