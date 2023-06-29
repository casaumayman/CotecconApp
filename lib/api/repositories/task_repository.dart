import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart';

class TaskRepository {
  TaskRepository();
  final Dio _apiProvider = Get.find();

  Future<List<Task>?> getList() async {
    final res = await _apiProvider.get('/tasks');
    final resModel = ListTaskResponse.fromJson(res.data);
    return resModel.tasks;
  }

  Future<TaskDetail?> getDetail(int id) async {
    final res = await _apiProvider.get('/tasks/$id');
    return TaskDetail.fromJson(res.data);
  }

  Future<void> create(CreateTaskRequest body) async {
    await _apiProvider.post('/tasks', data: body.toJson());
  }

  Future<List<Comment>?> getListComment(int id) async {
    final res = await _apiProvider.get('/tasks/$id/comments');
    if (res.data == null) {
      return null;
    }
    return (ListCommentResponse.fromJson(res.data)).comments;
  }

  Future<void> sendComment(int id, String message) async {
    await _apiProvider.post('/tasks/$id/comments', data: {"msg": message});
  }

  Future<void> changeStatus(int id, TaskStatus status) async {
    await _apiProvider.patch('/tasks/$id',
        data: {"status": TaskStatusUtils.toStringJson(status)});
  }
}
