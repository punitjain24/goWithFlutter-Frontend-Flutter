// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponse _$RegistrationResponseFromJson(
  Map<String, dynamic> json,
) => RegistrationResponse(
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$RegistrationResponseToJson(
  RegistrationResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
