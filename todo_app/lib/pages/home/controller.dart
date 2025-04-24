import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  int pageIdx = 0; // page manager, 0 todo, 1 user
  int todoIdx = 1; // page manager, 0 tasks, 1 create, 0 update

  void changePage(int idx) {
    pageIdx = idx;
    update(); // 通知GetBuilder刷新界面
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  initData() async {

  }


}