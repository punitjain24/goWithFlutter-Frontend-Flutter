import 'package:go_with_flutter/domain/model/responseModel/loginResponse/loginResponse.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  final LoginResponse response;
  LoginSuccessState(this.response);
  List<Object> get props => [response];
}
class LoginErrorState extends LoginState{
  final String msg;
  LoginErrorState(this.msg);
  List<Object> get props => [msg];
}