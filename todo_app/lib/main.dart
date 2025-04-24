import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

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

  // WidgetsFlutterBinding.ensureInitialized(); // 保险一点
  await GetStorage.init(); // 必须要初始化

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
      title: "TODO",
      initialRoute: AppPages.InitRoute,
      // 默认路由
      getPages: AppPages.routers,
      // 页面表
      unknownRoute: AppPages.unknownRoute,
      // // 404路由
      // theme: ThemeData(fontFamily: "DingTalkJinBuTi"),
      // 基础配置
      debugShowCheckedModeBanner: false, // 不显示debug
    );
  }
}