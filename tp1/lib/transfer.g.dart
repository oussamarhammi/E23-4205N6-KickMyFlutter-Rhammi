// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest()
      ..username = json['username'] as String
      ..password = json['password'] as String;

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

HomeItemResponse _$HomeItemResponseFromJson(Map<String, dynamic> json) =>
    HomeItemResponse()
      ..id = json['id'] as int?
      ..name = json['name'] as String
      ..percentageDone = json['percentageDone'] as int?
      ..percentageTimeSpent = (json['percentageTimeSpent'] as num?)?.toDouble()
      ..deadline = DateTime.parse(json['deadline'] as String);

Map<String, dynamic> _$HomeItemResponseToJson(HomeItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'deadline': instance.deadline.toIso8601String(),
    };

AddTaskRequest _$AddTaskRequestFromJson(Map<String, dynamic> json) =>
    AddTaskRequest()
      ..name = json['name'] as String
      ..deadline = _fromJson(json['deadline'] as String);

Map<String, dynamic> _$AddTaskRequestToJson(AddTaskRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deadline': _toJson(instance.deadline),
    };

SigninRequest _$SigninRequestFromJson(Map<String, dynamic> json) =>
    SigninRequest()
      ..username = json['username'] as String
      ..password = json['password'] as String;

Map<String, dynamic> _$SigninRequestToJson(SigninRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) =>
    SigninResponse()..username = json['username'] as String;

Map<String, dynamic> _$SigninResponseToJson(SigninResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
    };
