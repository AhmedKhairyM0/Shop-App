import 'package:dio/dio.dart';

class DioHelper {
  final _baseUrl = 'https://student.valuxapps.com/api/';

  // Singleton pattern
  static DioHelper? _instance;

  DioHelper._() {
    _options = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          'Content-Type': Headers.jsonContentType,
        });
    _dio = Dio(_options);
  }
  factory DioHelper() {
    return _instance ??= DioHelper._();
  }

  BaseOptions? _options;
  late Dio _dio;

  Future<Response> getData({
    required String path,
    String lang = 'en',
    String token = "",
    Map<String, dynamic>? query,
  }) async {
    var headers = _dio.options.headers;
    headers.addAll({
      'lang': lang,
      'Authorization': token,
    });
    return await _dio.get(
      path,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String token = '',
  }) async {
    var headers = _dio.options.headers;
    headers.addAll({
      'lang': lang,
      'Authorization': token,
    });
    return await _dio.post(
      path,
      data: data,
      options: Options(headers: headers),
      queryParameters: query,
    );
  }

  Future<Response> putData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String token = '',
  }) async {
    var headers = _dio.options.headers;
    headers.addAll({
      'lang': lang,
      'Authorization': token,
    });
    return await _dio.put(
      path,
      data: data,
      options: Options(headers: headers),
      queryParameters: query,
    );
  }
}