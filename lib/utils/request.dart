import 'package:dio/dio.dart';

class Request {
  late final Dio dio;
  Request({BaseOptions? options}) {
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Do something before request is sent.
    // If you want to resolve the request with custom data,
    // you can resolve a `Response` using `handler.resolve(response)`.
    // If you want to reject the request with a error message,
    // you can reject with a `DioException` using `handler.reject(dioError)`.
    // options.headers.addAll({other})
    return handler.next(options);
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data.
    // If you want to reject the request with a error message,
    // you can reject a `DioException` object using `handler.reject(dioError)`.
    return handler.next(response);
  }

  void _onError(DioException error, ErrorInterceptorHandler handler) {
    // Do something with response error.
    // If you want to resolve the request with some custom data,
    // you can resolve a `Response` object using `handler.resolve(response)`.
    return handler.next(error);
  }

  Future<Map<String, dynamic>> get(String url, Map<String, dynamic>? params,
      {Map<String, dynamic>? headers}) async {
    var res = await dio.get(url,
        queryParameters: params, options: Options(headers: headers));
    return res.data!;
  }

  post<T>(String url, Map<String, dynamic>? params,
      {Map<String, dynamic>? headers}) {
    return dio.post<T>(url, data: params, options: Options(headers: headers));
  }
}

Request request =
    Request(options: BaseOptions(baseUrl: 'https://cnodejs.org/api/v1'));
