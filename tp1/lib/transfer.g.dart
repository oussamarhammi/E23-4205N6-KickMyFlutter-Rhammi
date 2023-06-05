part of 'transfer.dart';


SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) {
  return SignupRequest()
    ..username = json['username'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return SignupResponse()..username = json['username'] as String;
}

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
    };