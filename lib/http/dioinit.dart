
import 'dart:collection';

import 'package:dio/dio.dart';

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = BaseOptions(
  baseUrl: "https://www.wanandroid.com/",
  connectTimeout: 10000,
  receiveTimeout: 5000,
) ;

Dio dio=Dio(options);


