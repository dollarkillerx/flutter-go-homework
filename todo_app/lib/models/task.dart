class TasksResponse {
  int? code;
  String? message;
  List<TaskItemData>? data;

  TasksResponse({this.code, this.message, this.data});

  TasksResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TaskItemData>[];
      json['data'].forEach((v) {
        data!.add(new TaskItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskItemData {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? title;
  String? description;

  TaskItemData(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.title,
        this.description});

  TaskItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
