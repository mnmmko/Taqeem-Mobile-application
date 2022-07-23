import 'package:dio/dio.dart';
Dio dio(){
  var dio=Dio(
    BaseOptions(
    baseUrl:'http://127.0.0.1:8000/api/v1/',
      responseType: ResponseType.plain,
      headers: {
      'accept':'application/json',
        'content-type':'application/json'
      }
    )
  );
  return dio;
}