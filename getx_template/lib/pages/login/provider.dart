import 'package:dio/dio.dart';
import '../../common/library/dio_api_request.dart';
import '../../common/entity/login.dart';

class LoginProvider extends ApiRequest {
  login(String email, String password) async {
    Response resp =  await post(url: "/login", variables: {
      "email": email,
      "password": password
    });

    Jwt jwt = Jwt.fromJson(resp.data);
    return jwt;
  }
}