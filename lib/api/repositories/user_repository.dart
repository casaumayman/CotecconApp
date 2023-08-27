import 'package:coteccons_app/models/models.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;

class UserRepository {
  final Dio _apiProvider = GetX.Get.find();
  Future<List<User>?> getUsers() async {
    final res = await _apiProvider.get('/users');
    if (res.data == null) {
      return null;
    }
    return (ListUserResponse.fromJson(res.data)).users;
  }

  Future<List<User>?> getListExecutors() async {
    final res = await _apiProvider.get('/executors');
    final resModel = ListExecutorResponse.fromJson(res.data);
    return resModel.executors;
  }
}
