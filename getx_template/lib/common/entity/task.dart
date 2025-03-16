class Tasks {
  List<TasksItem>? tasks;

  Tasks({this.tasks});

  Tasks.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <TasksItem>[];
      json['tasks'].forEach((v) {
        tasks!.add(new TasksItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TasksItem {
  String? taskName;
  String? taskDescription;

  TasksItem({this.taskName, this.taskDescription});

  TasksItem.fromJson(Map<String, dynamic> json) {
    taskName = json['task_name'];
    taskDescription = json['task_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_name'] = this.taskName;
    data['task_description'] = this.taskDescription;
    return data;
  }
}
