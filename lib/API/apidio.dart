import 'package:dio/dio.dart';
import 'package:path/path.dart';
class CustomDio {
  late Dio _dio;
 // final String baseurl = "http://127.0.0.1:8000";
  final String baseurl = "https://taqeemss.000webhostapp.com";

  CustomDio() {

    _dio = Dio();
    _dio.options.baseUrl = baseurl;
    _dio.options.validateStatus = (_) => true;
    //_dio.options.headers = "";
    _dio.options.sendTimeout = 1000;
    _dio.options.receiveTimeout = 1000;
    _dio.options.connectTimeout = 1000;

  }
  Future<Response> send(
      {required String reqMethod,
        required String path,
        Function(int count, int total)? onSendProgress,
        Function(int count, int total)? onReceiveProgress,
        CancelToken? cancelToken,
        Map<String, dynamic> body = const <String, dynamic>{},
        Map<String, dynamic> query = const <String, dynamic>{},
        String? saveDirPath}) async {
    late Response res;

    final _body = {}..addAll(body);
    final _query = {}..addAll(query);

    try {
      switch (reqMethod.toUpperCase()) {
        case 'GET':
          res = await _dio.get(
            path,
            cancelToken: cancelToken,
            queryParameters: _query.cast(),
          );
          break;
        case 'POST':
          res = await _dio.post(
            path,
            data: _body.cast(),
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
            cancelToken: cancelToken,
            queryParameters: _query.cast(),
          );
          break;
        case 'PUT':
          res = await _dio.put(
            path,
            data: _body.cast(),
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken,
            queryParameters: _query.cast(),
          );
          break;
        case 'PATCH':
          res = await _dio.patch(
            path,
            data: _body.cast(),
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken,
            queryParameters: _query.cast(),
          );
          break;
        case 'DELETE':
          res = await _dio.delete(
            path,
            data: _body.cast(),
            cancelToken: cancelToken,
            queryParameters: _query.cast(),
          );
          break;


        default:
          throw UnimplementedError();
      }

      _throwIfNoSuccess(res);

      return res;
    } on DioError catch (err) {
      if (err.type == DioErrorType.other ||
          err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.receiveTimeout ||
          err.type == DioErrorType.sendTimeout) {
        throw("Bad Network Or Server Not available now");
      }else{
        throw(res.data);
      }

    }catch(err) {
      rethrow;
    }finally {
      _dio.close();
    }
  }
  }

  void _throwIfNoSuccess(Response response) {
    if (response.statusCode! > 300) {

      final errorMsg = response.data;
      throw (errorMsg);
    }
  }
