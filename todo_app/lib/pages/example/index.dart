import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ExamplePage extends GetView<ExampleController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExampleController>(builder: (controller) {
      return Scaffold(
        body: Container(),
      );
    });
  }
}