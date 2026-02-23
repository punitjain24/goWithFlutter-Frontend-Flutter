// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  token: json['token'] as String?,
  userInfo: json['userInfo'] == null
      ? null
      : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'token': instance.token,
  'userInfo': instance.userInfo,
};

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
  id: json['id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  country: json['country'] as String?,
  mobileNumber: json['mobileNumber'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'mobileNumber': instance.mobileNumber,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
};
