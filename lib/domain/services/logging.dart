import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    // 🔹 Add token automatically
    final token = "your_saved_jwt_token_here";

    if (token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    print("REQUEST[${options.method}] => PATH: ${options.path}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}");

    if (err.response?.statusCode == 401) {
      // 🔥 Handle unauthorized globally
      print("Unauthorized! Redirect to login.");
    }

    return handler.next(err);
  }
}