import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_notification_response.g.dart';

@JsonSerializable()
class ListNotificationResponse {
  List<Notification> notifications;

  ListNotificationResponse({this.notifications = const []});

  factory ListNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListNotificationResponseToJson(this);
}
