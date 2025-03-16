import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("this is titile"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              TextField(
                controller: controller.email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                controller: controller.password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  controller.login();
                },
                child: Container(
                  height: 50,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("Login", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}