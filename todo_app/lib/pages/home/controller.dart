import 'package:get/get.dart';

class HomeController extends GetxController {
  int pageIdx = 0;

  void changePage(int idx) {
    pageIdx = idx;
    update(); // 通知GetBuilder刷新界面
  }
}