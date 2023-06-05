import 'package:dio/dio.dart';
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


Future<SigninResponse> signup(SignupRequest req) async {
  try {
    var response = await SingletonDio.getDio().post(
        'http://10.0.2.2:8080/api/id/signup',
        data: req.toJson()
    );
    print(response);
    return  SigninResponse.fromJson(response.data);

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

Future<String> addtask(AddTaskRequest req) async {
  try {
    var response = await SingletonDio.getDio().post(
        'http://10.0.2.2:8080/api/add',
        data: req.toJson()
    );
    print(response);
    return  response.data;

  } catch (e) {
    print(e);
    String message = (e as DioError).response!.data;
    if(message == "TooShort") {
      throw Exception('nom de tache trop court');
    }
    if(message == "Empty") {
      throw Exception('veuillez nommez votre tache');
    }
    if(message == "Existing") {
      throw Exception('tache existe deja');
    }else{
      throw Exception('Erreur avec le serveur');
    }
  }
}

Future<SigninResponse> signin(SigninRequest req) async {
  try {
    var response = await SingletonDio.getDio().post(
        'http://10.0.2.2:8080/api/id/signin',
        data: req.toJson()
    );
    print(response);
    return  SigninResponse.fromJson(response.data);

  } catch (e) {
    print(e);
    String message = (e as DioError).response!.data;
    if(message == "InternalAuthenticationServiceException") {
      throw Exception('utilisateur n existe pas');
    }
    if(message == "BadCredentialsException") {
      throw Exception(' nom utilisateur ou mot de passe non valide');
    }
    else{
      throw Exception('Erreur avec le serveur');
    }
  }
}

Future<List<HomeItemResponse>> home() async {
  try {
    var response = await SingletonDio.getDio().get(
        'http://10.0.2.2:8080/api/home'
    );
    print(response);
    var listeJSON = response.data as List;
    var listeTruc = listeJSON.map(
            (elementJSON) {
          return HomeItemResponse.fromJson(elementJSON);
        }
    ).toList();
    return  listeTruc;
  } catch (e) {
    print(e);
    String message = (e as DioError).response!.data;
    if(message == "InternalAuthenticationServiceException") {
      throw Exception('utilisateur non connecter');
    }
    else{
      throw Exception('Erreur avec le serveur');
    }
  }
}

class ServerException implements Exception {

}