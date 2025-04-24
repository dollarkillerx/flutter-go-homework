import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(35),
              width: Get.width,
              child: Column(
                children: [
                  Text("登录 TODO", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                  SizedBox(height: 50,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '手机号',
                      hintText: '请输入手机号',
                  )),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '密码',
                      hintText: '请输入密码',
                    ),
                  ),
                  SizedBox(height: 35,),
                  InkWell(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),),
                      child: Text("登录", style: TextStyle(fontSize: 26, color: Colors.white),),
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}