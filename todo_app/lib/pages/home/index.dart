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
            Center(child: Text('首页')), // 示例页面1
            Center(child: Text('我的')), // 示例页面2
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
}
