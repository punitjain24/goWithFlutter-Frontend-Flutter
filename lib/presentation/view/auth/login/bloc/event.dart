import 'package:go_with_flutter/domain/model/requestModel/loginRequest/loginRequest.dart';

abstract class LoginEvent{}

class SubmitEvent extends LoginEvent{
  final LoginRequest request ;
  SubmitEvent(this.request);
}