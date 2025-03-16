import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_template/common/entity/task.dart';

class HomeController extends GetxController {
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDescription = TextEditingController();

  List<TasksItem> taskList = [];

  @override
  void onInit() {
    super.onInit();
    getTask();
  }

  void getTask() {
    // HomeProvider()
  }

  void addTask() {
    taskList.add(TasksItem(taskName: taskName.text, taskDescription: taskDescription.text));
    // post api
  }
}