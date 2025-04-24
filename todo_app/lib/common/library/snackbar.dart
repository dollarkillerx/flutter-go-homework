import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void snackbarError(String err) {
  Get.snackbar(
    'Error',  // 标题，留空表示不显示标题
    err,  // 显示的消息内容
    snackPosition: SnackPosition.TOP,  // 显示在底部
    backgroundColor: Colors.red.withOpacity(0.7),  // 背景颜色
    colorText: Colors.white,  // 文字颜色
    margin: EdgeInsets.all(10),  // 外边距
    duration: Duration(seconds: 2),  // 显示时间
  );
}

void snackbar(String msg) {
  Get.snackbar(
    'Message',  // 标题，留空表示不显示标题
    msg,  // 显示的消息内容
    snackPosition: SnackPosition.TOP,  // 显示在底部
    backgroundColor: Colors.grey.withOpacity(0.3),  // 背景颜色
    colorText: Colors.white,  // 文字颜色
    margin: EdgeInsets.all(10),  // 外边距
    duration: Duration(seconds: 2),  // 显示时间
  );
}