import 'package:coteccons_app/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart' as Getx;
import 'package:image_picker/image_picker.dart';

class PrivateTaskRepository {
  PrivateTaskRepository();
  final Dio _apiProvider = Getx.Get.find();

  Future<List<PrivateTask>?> getList() async {
    final res = await _apiProvider.get('/private-tasks');
    final resModel = ListPrivateTaskResponse.fromJson(res.data);
    return resModel.tasks;
  }

  Future<List<PrivateTask>?> getMyList() async {
    final res = await _apiProvider
        .get('/private-tasks', queryParameters: {"filter": "my-tasks"});
    final resModel = ListPrivateTaskResponse.fromJson(res.data);
    return resModel.tasks;
  }

  Future<PrivateTask?> getDetail(int id) async {
    final res = await _apiProvider.get('/private-tasks/$id');
    return PrivateTask.fromJson(res.data);
  }

  Future<void> create(CreateTaskRequest body) async {
    await _apiProvider.post('/private-tasks', data: body.toJson());
  }

  // Future<void> update(int id, UpdateTaskRequest body) async {
  //   await _apiProvider.put('/tasks/$id', data: body.toJson());
  // }

  Future<List<Comment>?> getListComment(int id) async {
    final res = await _apiProvider.get('/private-tasks/$id/comments');
    if (res.data == null) {
      return null;
    }
    return (ListCommentResponse.fromJson(res.data)).comments;
  }

  Future<void> sendComment(int id, String message) async {
    await _apiProvider
        .post('/private-tasks/$id/comments', data: {"msg": message});
  }

  Future<void> changeStatus(int id, TaskStatus status) async {
    await _apiProvider.patch('/tasks/$id',
        data: {"status": TaskStatusUtils.toStringJson(status)});
  }

  Future<void> uploadTaskImage(int id, XFile xFile) async {
    final formData =
        FormData.fromMap({"image": await MultipartFile.fromFile(xFile.path)});
    await _apiProvider.post('/tasks/$id/images',
        data: formData,
        options: Options(headers: {"Content-Type": "multipart/form-data"}));
  }
}
