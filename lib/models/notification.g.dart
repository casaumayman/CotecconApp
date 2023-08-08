// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String?,
      reviewText: json['review_text'] as String?,
      message: json['message'] as String?,
      publicTask: Task.fromJson(json['public_task'] as Map<String, dynamic>),
      sender: CommentCreator.fromJson(json['sender'] as Map<String, dynamic>),
      sendTime: json['send_time'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'review_text': instance.reviewText,
      'message': instance.message,
      'public_task': instance.publicTask,
      'sender': instance.sender,
      'send_time': instance.sendTime,
    };
