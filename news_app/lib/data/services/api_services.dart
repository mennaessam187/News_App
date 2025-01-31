//import 'dart:async';

import 'package:dio/dio.dart';
import 'package:news_app/utils/app_const.dart';

class apiServices {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstant.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}
