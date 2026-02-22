import 'package:dio/dio.dart';
import 'package:go_with_flutter/domain/services/apis.dart';
import 'package:go_with_flutter/domain/services/logging.dart';
class AppRepository{
   static  Dio dio=Dio(BaseOptions(
    baseUrl:Apis.baseUrl,
    contentType: "application/json",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  )
  )..interceptors.add(AppInterceptor())
   ..interceptors.add(LogInterceptor(requestBody: true,responseBody: true))
  ;
}