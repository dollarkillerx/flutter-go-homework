import 'package:get/get.dart';
import 'package:getx_template/pages/home/binding.dart';
import 'package:getx_template/pages/home/index.dart';
import 'package:getx_template/pages/login/binding.dart';
import 'package:getx_template/pages/login/index.dart';
import '../../components/unknown_route.dart';
import '../library/local_storage.dart';
import 'app_routes.dart';

String InitRoute () {
  String? jwt = LocalStorage.getJWT();
  if (jwt != null) {
    return AppRoutes.Home;
  }
  return AppRoutes.Login;
}


class AppPages {

  static final routers = [
    // login
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    // home
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    )
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => UnknownRoute(),
  );
}