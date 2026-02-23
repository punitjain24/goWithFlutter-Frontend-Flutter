import 'package:json_annotation/json_annotation.dart';

part 'registrationResponse.g.dart';

@JsonSerializable()
class RegistrationResponse {
  String? message;
  bool? success;

  RegistrationResponse({this.message, this.success});
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}