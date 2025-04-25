import '../../common/library/dio_api_request.dart';
import 'package:dio/dio.dart';

import '../../models/task.dart';

class HomeProvider extends ApiRequest {
  Future<TasksResponse> getTasks() async {
    Response resp = await get(
        url: "/private/tasks",
    );
    if (resp.statusCode != 200) { throw '${resp.data}'; }

    return TasksResponse.fromJson(resp.data);
  }

  createTask(String title, String description) async {
    Response resp = await post(
        url: "/private/task",
        variables: {
          "title": title,
          "description": description
        }
    );
    if (resp.statusCode != 200) { throw '${resp.data}'; }
  }
}


