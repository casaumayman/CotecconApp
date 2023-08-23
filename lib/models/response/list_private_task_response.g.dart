// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_private_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPrivateTaskResponse _$ListPrivateTaskResponseFromJson(
        Map<String, dynamic> json) =>
    ListPrivateTaskResponse(
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ListPrivateTaskResponseToJson(
        ListPrivateTaskResponse instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
