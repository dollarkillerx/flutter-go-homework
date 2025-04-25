import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/pages/home/provider.dart';

import '../../models/task.dart';

class HomeController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  List<TaskItemData>? taskItems;

  int pageIdx = 0; // page manager, 0 todo, 1 user
  int todoIdx = 0; // page manager, 0 tasks, 1 create, 0 update

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
    try {
      TasksResponse resp = await HomeProvider().getTasks();
      taskItems = resp.data;
      update();
    }catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  createTask() async {
   var titleString = title.text.trim();
   var descriptionString = description.text.trim();
   if (title.text.isEmpty || description.text.isEmpty) {
     Get.snackbar("Error", "title and description are required");
     return;
   }
   title.clear();
   description.clear();


   try {
      await HomeProvider().createTask(titleString, descriptionString);
      todoIdx = 0;
      await initData();
      update();
      Get.snackbar("Success", "create success");
   }catch (e) {
     Get.snackbar("Error", e.toString());
   }
 }

}