import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("home page"),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                formWg(),
              ],
            ),
          ),
        ),
      );
    });
  }


  Widget formWg() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'TaskName: ',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description: ',
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: Text("Add Task"),
            ),
          )
        ],
      ),
    );
  }
}