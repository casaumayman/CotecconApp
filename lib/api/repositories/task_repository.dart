import 'package:coteccons_app/models/request/update_task_request.dart';
import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:coteccons_app/shared/shared.dart';
import 'package:get/get.dart' as Getx;
import 'package:image_picker/image_picker.dart';

class TaskRepository {
  TaskRepository();
  final Dio _apiProvider = Getx.Get.find();

  Future<List<Task>?> getList() async {
    final res = await _apiProvider.get('/tasks');
    final resModel = ListTaskResponse.fromJson(res.data);
    return resModel.tasks;
  }

  Future<List<Task>?> getImportantList() async {
    final res = await _apiProvider.get('/important-tasks');
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

  Future<void> update(int id, UpdateTaskRequest body) async {
    await _apiProvider.put('/tasks/$id', data: body.toJson());
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

  Future<void> changeStatus(int id, TaskStatus status, int? star) async {
    final data = star != null
        ? {"status": TaskStatusUtils.toStringJson(status), "star": star}
        : {"status": TaskStatusUtils.toStringJson(status)};
    await _apiProvider.patch('/tasks/$id', data: data);
  }

  Future<void> uploadTaskImage(int id, XFile xFile) async {
    final formData =
        FormData.fromMap({"image": await MultipartFile.fromFile(xFile.path)});
    await _apiProvider.post('/tasks/$id/images',
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data"}));
  }

  Future<void> remind(int taskID, String message) async {
    await _apiProvider
        .post('/tasks/$taskID/remind', data: {"message": message});
  }
}
