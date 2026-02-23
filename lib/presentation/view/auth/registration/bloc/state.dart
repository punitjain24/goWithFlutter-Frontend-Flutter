import 'package:go_with_flutter/domain/model/responseModel/registrationResponse/registrationResponse.dart';

abstract class RegistrationState{}
class RegistrationInitialState extends RegistrationState{}
class RegistrationLoadingState extends RegistrationState{}
class RegistrationSuccessState extends RegistrationState{
  final RegistrationResponse response;
   RegistrationSuccessState(this.response);
  List<Object> get props => [response];

}
class RegistrationErrorState extends RegistrationState{
  final String error;
  RegistrationErrorState(this.error);
  List<Object> get props => [error];
}