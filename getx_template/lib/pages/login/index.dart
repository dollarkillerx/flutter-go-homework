import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: Center(
          child: Text("login"),
        ),
      );
    });
  }
}