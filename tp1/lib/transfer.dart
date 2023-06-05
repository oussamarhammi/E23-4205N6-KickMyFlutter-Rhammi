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
class AddTaskRequest  {
  AddTaskRequest();
  String name='';
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime deadline= DateTime.now();
  factory AddTaskRequest .fromJson(Map<String, dynamic> json) => _$AddTaskRequestFromJson(json);
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