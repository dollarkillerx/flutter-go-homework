import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.pageIdx,
          children: [
            todoPage(), // todo page
            Center(child: Text('我的', style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),)), // 示例页面2
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.pageIdx,
          onTap: controller.changePage, // 点击切换页面
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'TODO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
        ),
      );
    });
  }


  Widget todoPage() {
    return SafeArea(child: Container(
      width: Get.width,
      child: IndexedStack(
          index: controller.todoIdx,
          children: [
            Container(
              child: Center(child: Text("Todo List"),),
            ),
            Container(
              width: Get.width,
              child: Column(
                children: [
                  Text("Create TODO", style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue,
                  ),),
                  SizedBox(height: 50,),
                  TextField(
                    controller: controller.title,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      hintText: 'please input title',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: controller.description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      hintText: 'please input description',
                    ),
                      ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Text("Create", style: TextStyle(color: Colors.white),),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
          ]
      ),
    ));
  }
}
