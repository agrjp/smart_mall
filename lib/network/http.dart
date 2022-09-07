import 'package:dio/dio.dart';

class Http {
  Dio _dio = Dio();

  static final Http instance = Http._instance();
  static const String _baseUrl = "http://192.168.0.108:8080/";
  Http._instance() {
    init();
  }
  init() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: 15000,
        responseType: ResponseType.plain,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    _dio = Dio(baseOptions);
  }

  Future<Response> get(String path, Map<String, dynamic> params) async {
    var result = await _dio.get(path, queryParameters: params);
    return result;
  }

  Future post<Response>(String path, Map<String, dynamic> params) async {
    var result = await _dio.post(path, queryParameters: params);
    return result;
  }
}
