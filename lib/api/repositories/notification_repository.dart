import 'package:coteccons_app/models/models.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;

class NotificationRepository {
  NotificationRepository();
  final Dio _apiProvider = GetX.Get.find();

  Future<List<Notification>?> getList() async {
    final res = await _apiProvider.get('/notifications');
    final resModel = ListNotificationResponse.fromJson(res.data);
    return resModel.notifications;
  }

  Future<Notification?> getDetail(int id) async {
    final res = await _apiProvider.get('/notifications/$id');
    return Notification.fromJson(res.data);
  }
}
