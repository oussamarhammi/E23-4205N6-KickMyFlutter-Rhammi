import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
part 'transfer.g.dart';


@JsonSerializable()
class SignupRequest {
  SignupRequest();
  String username='';
  String password='';
  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable()
class ProgressEvent  {
  ProgressEvent ();
  int? value;
  DateTime timestamp= DateTime.now();
  factory ProgressEvent.fromJson(Map<String, dynamic> json) => _$ProgressEventFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressEventToJson(this);
}

@JsonSerializable()
class TaskDetailResponse  {
  TaskDetailResponse ();
  int? id;
  String name='';
  DateTime deadline= DateTime.now();
  List<ProgressEvent> events=[];
  int? percentageDone;
  double percentageTimeSpent=0;
  factory TaskDetailResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDetailResponseToJson(this);
}
@JsonSerializable()
class HomeItemResponse  {
  HomeItemResponse ();
  int? id;
  String name='';
  int percentageDone=0;
  double percentageTimeSpent=0;
  DateTime deadline= DateTime.now();
  factory HomeItemResponse.fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}

@JsonSerializable()
class AddTaskRequest  {
  AddTaskRequest();
  String name='';
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline= DateTime.now();
  factory AddTaskRequest.fromJson(Map<String, dynamic> json) => _$AddTaskRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddTaskRequestToJson(this);
}

final _dateFormatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
DateTime _fromJson(String date) => _dateFormatter.parse(date);
String _toJson(DateTime date) => _dateFormatter.format(date);

@JsonSerializable()
class SigninRequest {
  SigninRequest();
  String username='';
  String password='';
  factory SigninRequest.fromJson(Map<String, dynamic> json) => _$SigninRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}

@JsonSerializable()
class SigninResponse {
  SigninResponse();
  String username='';
  factory SigninResponse.fromJson(Map<String, dynamic> json) => _$SigninResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}