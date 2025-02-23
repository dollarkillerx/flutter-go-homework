import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'common/routers/app_pages.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 全局设置透明appBar
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return GetMaterialApp(
      title: "App Name",
      initialRoute: InitRoute(),
      // 默认路由
      getPages: AppPages.routers,
      // 页面表
      unknownRoute: AppPages.unknownRoute,
      // 404路由
      debugShowCheckedModeBanner: false, // 不显示debug
    );
  }
}