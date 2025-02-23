import 'package:get/get.dart';
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
    // 主页导航
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => UnknownRoute(),
  );
}