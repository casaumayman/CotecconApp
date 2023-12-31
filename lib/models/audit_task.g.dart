// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuditTask _$AuditTaskFromJson(Map<String, dynamic> json) => AuditTask(
      json['id'] as int?,
      json['code'] as String?,
      json['description'] as String?,
      json['end_time'] as String?,
      json['executor'] == null
          ? null
          : User.fromJson(json['executor'] as Map<String, dynamic>),
      (json['executor_images'] as List<dynamic>?)
          ?.map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['name'] as String?,
      (json['owner_images'] as List<dynamic>?)
          ?.map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority_level']),
      json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      json['project_id'] as int?,
      json['project_name'] as String?,
      json['start_time'] as String?,
      $enumDecode(_$TaskStatusEnumMap, json['status']),
      json['acceptor'] == null
          ? null
          : User.fromJson(json['acceptor'] as Map<String, dynamic>),
      json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      json['star'] as int?,
    );

Map<String, dynamic> _$AuditTaskToJson(AuditTask instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'project_id': instance.projectId,
      'project_name': instance.projectName,
      'project': instance.project,
      'creator': instance.creator,
      'executor': instance.executor,
      'acceptor': instance.acceptor,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'description': instance.description,
      'priority_level': _$TaskPriorityEnumMap[instance.priorityLevel],
      'status': _$TaskStatusEnumMap[instance.status]!,
      'star': instance.star,
      'owner_images': instance.ownerImages,
      'executor_images': instance.executorImages,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.HIGH: 'high',
  TaskPriority.NORMAL: 'normal',
  TaskPriority.LOW: 'low',
  TaskPriority.UNKNOWN: 'unknown',
};

const _$TaskStatusEnumMap = {
  TaskStatus.REQUESTED: 'requested',
  TaskStatus.ACCEPTED: 'accepted',
  TaskStatus.REJECTED: 'rejected',
  TaskStatus.CANCELED: 'cancel',
  TaskStatus.COMPLETED: 'completed',
  TaskStatus.CREATED: 'created',
  TaskStatus.APPROVED: 'approved',
  TaskStatus.IMPLEMENTING: 'implementing',
  TaskStatus.UNKNOWN: 'unknown',
};
