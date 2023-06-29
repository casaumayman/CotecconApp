import 'package:dio/dio.dart';
import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:get/get.dart';

class ExecutorRepository {
  ExecutorRepository();
  final Dio apiProvider = Get.find();

  Future<List<Executor>?> getList() async {
    final res = await apiProvider.get('/executors');
    final resModel = ListExecutorResponse.fromJson(res.data);
    return resModel.executors;
  }
}
