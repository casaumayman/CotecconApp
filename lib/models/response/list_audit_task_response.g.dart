// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_audit_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAuditTaskResponse _$ListAuditTaskResponseFromJson(
        Map<String, dynamic> json) =>
    ListAuditTaskResponse(
      (json['tasks'] as List<dynamic>)
          .map((e) => AuditTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListAuditTaskResponseToJson(
        ListAuditTaskResponse instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
