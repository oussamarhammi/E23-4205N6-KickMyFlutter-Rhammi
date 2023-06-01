import 'package:dio/dio.dart';
import 'package:tp1/transfer.dart';

final dio = Dio();
Future <SignupResponse> signup(SignupRequest req) async {
  try{
    Response response;
    response = await dio.post('http://10.0.2.2:8080/api/id/signup', data: req);
    print(response);
    return SignupResponse.fromJson(response.data);
  }
  catch(e) {
    print(e);
    throw(e);
  }
}