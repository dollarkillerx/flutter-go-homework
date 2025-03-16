import 'package:dio/dio.dart';
import 'package:getx_template/common/entity/task.dart';

import '../../common/library/dio_api_request.dart';

class HomeProvider extends ApiRequest {
  getTasks() async {
    Response response = await get(url: "private/todo/get");

    Tasks tasks = Tasks.fromJson(response.data);

    return tasks;
  }

  setTasks(List<TasksItem> items) async {
    await post(url: "/private/todo/set", variables: {
      "tasks": items,
    });
  }
}