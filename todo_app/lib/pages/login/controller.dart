import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/library/local_storage.dart';
import 'package:todo_app/pages/login/provider.dart';

import '../../common/routers/app_routes.dart';
import '../../models/login.dart';

class LoginController extends GetxController {
  int pageIdx = 1;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    email.text = email.text.trim();
    password.text = password.text.trim();

    // validate
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    // login
    try {
      LoginResponse resp = await LoginProvider().login(email.text, password.text);
      LocalStorage.setJWT(resp.data!.token!);
      Get.offAllNamed(AppRoutes.Home);
      Get.snackbar("Success", "Login success");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  register() async {
    email.text = email.text.trim();
    password.text = password.text.trim();
    // validate
    if (email.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    // login
    try {
      await LoginProvider().register(email.text, password.text);
      Get.snackbar("Success", "Register success");
      pageIdx = 0;
      update();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();

    String? jwt = LocalStorage.getJWT();
    if (jwt != null) {
      Get.offAllNamed(AppRoutes.Home);
    }
  }
}