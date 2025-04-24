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
              child: IndexedStack(
                index: controller.pageIdx,
                children: [
                  Column(
                    children: [
                      Text("Login TODO", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      SizedBox(height: 50,),
                      TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'please input email',
                          )),
                      SizedBox(height: 20,),
                      TextField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'password',
                          hintText: 'please input password',
                        ),
                      ),
                      SizedBox(height: 35,),
                      InkWell(
                        onTap: () async {
                          controller.login();
                        },
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),),
                          child: Text("Login", style: TextStyle(fontSize: 26, color: Colors.white),),
                        ),
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          controller.pageIdx = 1;
                          controller.update();
                        },
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),),
                          child: Text("Register", style: TextStyle(fontSize: 26, color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Register TODO", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      SizedBox(height: 50,),
                      TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'please input email',
                          )),
                      SizedBox(height: 20,),
                      TextField(
                        obscureText: true,
                        controller: controller.password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'please input password',
                        ),
                      ),
                      SizedBox(height: 35,),
                      InkWell(
                        onTap: () {
                          controller.register();
                        },
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),),
                          child: Text("Register", style: TextStyle(fontSize: 26, color: Colors.white),),
                        ),
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          controller.pageIdx = 0;
                          controller.update();
                        },
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),),
                          child: Text("Login", style: TextStyle(fontSize: 26, color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      );
    });
  }
}