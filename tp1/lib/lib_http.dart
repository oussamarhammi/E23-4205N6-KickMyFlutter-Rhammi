import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1/transfer.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';


class SingletonDio {

  static var cookiemanager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);
    return dio;
  }
}


Future<SignupResponse> signup(SignupRequest req) async {
  try {
    var response = await SingletonDio.getDio().post(
        'http://10.0.2.2:8080/api/id/signup',
        data: req
    );
    print(response);
    return  SignupResponse.fromJson(response.data);

  } catch (e) {
    print(e);
    String message = (e as DioError).response!.data;
    if(message == "UsernameAlreadyTaken") {
      throw Exception('nom utilisateur deja utilisé');
    }
    if(message == "PasswordTooShort") {
      throw Exception('mot de passe trop court');
    }

    if(message == "UsernameTooShort") {
      throw Exception('nom utilisateur trop court');
    }else{
      throw Exception('Erreur avec le serveur');
    }
  }
}

class ServerException implements Exception {

}