import 'package:go_with_flutter/domain/model/requestModel/registrationRequest.dart';

abstract class RegistrationEvent{}

class SubmitEvent extends RegistrationEvent{
  final RegistrationRequest request;
  SubmitEvent(this.request);
}