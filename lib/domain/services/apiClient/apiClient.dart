import 'package:dio/dio.dart';
import 'package:go_with_flutter/domain/model/requestModel/registrationRequest.dart';
import 'package:go_with_flutter/domain/model/responseModel/registrationResponse.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../apis.dart';

part 'apiClient.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) =_ApiClient;

@POST(Apis.register)
Future<RegistrationResponse> registerUser(@Body() RegistrationRequest request);
}