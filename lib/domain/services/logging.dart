import 'package:dio/dio.dart';
import 'package:go_with_flutter/domain/services/routes.dart';
import 'package:go_with_flutter/main.dart';
import 'package:go_with_flutter/utlis/secure_storage.dart';

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
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("ERROR[${err.response?.statusCode}] => ${err.message}");

    // ✅ Handle No Internet / Timeout
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {

      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: "Please check your  internet connection",
          type: DioExceptionType.unknown,
        ),
      );
    }

    // ✅ Handle Unauthorized (401)
    if (err.response?.statusCode == 401) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
      SecureStorageService.clearData();
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: "Invalid email or password",
          type: DioExceptionType.badResponse,
          response: err.response,
        ),
      );
    }

    // ✅ Other errors
    return handler.next(err);
  }
}