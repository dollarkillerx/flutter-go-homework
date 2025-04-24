import '../../common/library/dio_api_request.dart';
import 'package:dio/dio.dart';

import '../../models/login.dart';

class LoginProvider extends ApiRequest {
  Future<LoginResponse> login(String email, String password) async {
    Response resp = await post(url: "/public/login", variables: {
      "email": email,
      "password": password
    });
    if (resp.statusCode != 200) {
      throw '${resp.data}';
    }

    return LoginResponse.fromJson(resp.data);
  }

  register(String email, String password) async {
    Response resp = await post(url: "/public/register", variables: {
      "email": email,
      "password": password
    });
    if (resp.statusCode != 200) {
      throw '${resp.data}';
    }
  }
}


