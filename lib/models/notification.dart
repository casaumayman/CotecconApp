import 'package:coteccons_app/models/comment_creator.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Notification {
  int id;
  String uuid;
  String? title;
  String? reviewText;
  String? message;
  Task publicTask;
  CommentCreator sender;
  String? sendTime;

  Notification({
    required this.id,
    required this.uuid,
    required this.title,
    required this.reviewText,
    required this.message,
    required this.publicTask,
    required this.sender,
    required this.sendTime,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
