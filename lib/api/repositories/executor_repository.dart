import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class ExecutorRepository {
  ExecutorRepository();
  final Dio apiProvider = Get.find();

  Future<List<User>?> getList() async {
    final res = await apiProvider.get('/executors');
    final resModel = ListExecutorResponse.fromJson(res.data);
    return resModel.executors;
  }
}
