
import 'package:json_annotation/json_annotation.dart';
part 'loginResponse.g.dart';
@JsonSerializable()
class LoginResponse {
  String? message;
  bool? success;
  LoginData? data;

  LoginResponse({this.message, this.success, this.data});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}

@JsonSerializable()
class LoginData {
  String? token;
  UserInfo? userInfo;

  LoginData({this.token, this.userInfo});
  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);

}

@JsonSerializable()
class UserInfo {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? city;
  String? state;
  String? country;
  String? mobileNumber;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserInfo(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.city,
        this.state,
        this.country,
        this.mobileNumber,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}