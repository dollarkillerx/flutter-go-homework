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
            SafeArea(child: Container(
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.todoIdx = 1;
                        controller.update();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green.withAlpha(100),
                          borderRadius: BorderRadius.circular(10),),
                        child: Text("Add Task", style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    if (controller.taskItems != null)
                      ...controller.taskItems!.map((task) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: Get.width,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title ?? "No Title",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                task.description ?? "No Description",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )),
                  ],
                ),
              ),
            )),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(10),
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
                      controller.createTask();
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
