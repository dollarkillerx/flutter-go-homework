import '../../common/entity/login.dart';
import '../../common/library/dio_api_request.dart';
import 'package:dio/dio.dart';

class LoginProvider extends ApiRequest {
  Future<JWT> login(String email,String password) async {
    Response resp = await post(url: "/login", variables: {
      "email": email,
      "password": password
    });

    JWT jwt = JWT.fromJson(resp.data);
    return jwt;
  }
}