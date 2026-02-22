// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrationRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequest _$RegistrationRequestFromJson(Map<String, dynamic> json) =>
    RegistrationRequest(
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      password: json['password'] as String?,
      confirm_password: json['confirm_password'] as String?,
      mobile_number: json['mobile_number'] as String?,
    );

Map<String, dynamic> _$RegistrationRequestToJson(
  RegistrationRequest instance,
) => <String, dynamic>{
  'first_name': instance.first_name,
  'last_name': instance.last_name,
  'email': instance.email,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'password': instance.password,
  'confirm_password': instance.confirm_password,
  'mobile_number': instance.mobile_number,
};
