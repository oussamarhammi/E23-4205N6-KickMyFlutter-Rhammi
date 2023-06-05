import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';


@JsonSerializable()


class SignupRequest {
  SignupRequest();
  String username='';
  String password='';
  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

class SigninRequest {
  SigninRequest();
  String username='';
  String password='';
  factory SigninRequest.fromJson(Map<String, dynamic> json) => _$SigninRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}

class SignupResponse {
  SignupResponse();
  String username='';
  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}