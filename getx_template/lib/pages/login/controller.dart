import 'package:get/get.dart';
import 'package:getx_template/pages/login/provider.dart';

class LoginController extends GetxController {
  login() async {
    var jwt = await LoginProvider().login("a@a.com", "123456");
    print(jwt.jwt);
  }
}