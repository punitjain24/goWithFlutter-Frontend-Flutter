
import 'package:json_annotation/json_annotation.dart';
part 'registrationRequest.g.dart';

@JsonSerializable()
class RegistrationRequest {
  String? first_name;
  String? last_name;
  String? email;
  String? city;
  String? state;
  String? country;
  String? password;
  String? confirm_password;
  String? mobile_number;

  RegistrationRequest(
      {this.first_name,
        this.last_name,
        this.email,
        this.city,
        this.state,
        this.country,
        this.password,
        this.confirm_password,
        this.mobile_number});

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) => _$RegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);
}