// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotificationResponse _$ListNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    ListNotificationResponse(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ListNotificationResponseToJson(
        ListNotificationResponse instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
    };
