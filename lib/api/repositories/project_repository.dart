import 'package:dio/dio.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:get/get.dart';

class ProjectRepository {
  ProjectRepository();
  final Dio apiProvider = Get.find();

  Future<List<Project>?> getList() async {
    final res = await apiProvider.get('/projects');
    final resModel = ListProjectResponse.fromJson(res.data);
    return resModel.projects;
  }
}
