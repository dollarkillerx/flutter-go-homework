// 引入 Flutter 的 Material 设计库，它提供了一套标准的 UI 组件
import 'package:flutter/material.dart';

// 应用的入口函数，Flutter 应用的主函数
void main() {
  runApp(MaterialApp(
    // runApp() 是 Flutter 应用的入口函数，它将 MaterialApp 作为根组件运行
    // MaterialApp 是 Flutter 提供的 Material Design 风格的应用顶级组件
    // 适用于 Android 和 iOS 平台（iOS 也能运行，但可能需要部分 Cupertino 组件优化体验）

    title: 'TODO LIST',  // 设置应用的标题（用于任务管理器和一些 UI 显示）
    theme: ThemeData(primarySwatch: Colors.blue),
    home: FormPage(), // 设置应用的首页（即应用启动后显示的第一个页面）
  ));
}


class FormPage extends StatefulWidget {
  @override
  @override
  TODOListScreen createState() => TODOListScreen();
}

class TODOListScreen extends State<FormPage> {
  // 这里是 FormPage 的状态管理逻辑
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<Map<String, String>> tasks = [];

  void addTask(){
    if (titleController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("task is empty!")),
      );
      return;
    }
    setState(() {
      tasks.insert(0, {
        'title': titleController.text.trim(),
        'content': contentController.text.trim(),
      });
    });
    titleController.clear();
    contentController.clear();
  }

  void removeTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO LIST APP'),
        ),
        body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                        tasks[index]['title']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: tasks[index]['content']!.isNotEmpty
                          ? Text(tasks[index]['content']!)
                          : null,
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeTask(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "任务名称",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                  labelText: "任务内容(可选)",
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: addTask,
              child: Text('添加任务'),
            ),



          ],
        ),
     ),
    );
  }
}
