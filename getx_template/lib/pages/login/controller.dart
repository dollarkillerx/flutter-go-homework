import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_template/common/entity/login.dart';
import 'package:getx_template/common/library/local_storage.dart';
import 'package:getx_template/common/routers/app_routes.dart';
import 'package:getx_template/pages/login/provider.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    try{
      Jwt jwt = await LoginProvider().login(email.text, password.text);
      LocalStorage.setJWT(jwt.jwt!);
      Get.toNamed(AppRoutes.Home);
    }catch (e) {
      print(e);
      Get.snackbar("error", "user not found or password error");
    }
  }
}