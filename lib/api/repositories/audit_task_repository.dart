import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart' as Getx;

class AuditTaskRepository {
  AuditTaskRepository();
  final Dio _apiProvider = Getx.Get.find();

  Future<List<AuditTask>?> getList() async {
    final res = await _apiProvider.get('/audit-tasks');
    final resModel = ListAuditTaskResponse.fromJson(res.data);
    return resModel.tasks;
  }

  // Future<PrivateTask?> getDetail(int id) async {
  //   final res = await _apiProvider.get('/tasks/$id');
  //   return PrivateTask.fromJson(res.data);
  // }

  // Future<void> create(CreateTaskRequest body) async {
  //   await _apiProvider.post('/tasks', data: body.toJson());
  // }

  // Future<void> update(int id, UpdateTaskRequest body) async {
  //   await _apiProvider.put('/tasks/$id', data: body.toJson());
  // }

  // Future<List<Comment>?> getListComment(int id) async {
  //   final res = await _apiProvider.get('/tasks/$id/comments');
  //   if (res.data == null) {
  //     return null;
  //   }
  //   return (ListCommentResponse.fromJson(res.data)).comments;
  // }

  // Future<void> sendComment(int id, String message) async {
  //   await _apiProvider.post('/tasks/$id/comments', data: {"msg": message});
  // }

  // Future<void> changeStatus(int id, TaskStatus status) async {
  //   await _apiProvider.patch('/tasks/$id',
  //       data: {"status": TaskStatusUtils.toStringJson(status)});
  // }

  // Future<void> uploadTaskImage(int id, XFile xFile) async {
  //   final formData =
  //       FormData.fromMap({"image": await MultipartFile.fromFile(xFile.path)});
  //   await _apiProvider.post('/tasks/$id/images',
  //       data: formData,
  //       options: Options(headers: {"Content-Type": "multipart/form-data"}));
  // }
}
