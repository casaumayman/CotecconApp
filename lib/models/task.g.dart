// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      code: json['code'] as String?,
      name: json['name'] as String?,
      projectId: json['project_id'] as int?,
      projectName: json['project_name'] as String?,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      executor: json['executor'] == null
          ? null
          : User.fromJson(json['executor'] as Map<String, dynamic>),
      acceptor: json['acceptor'] == null
          ? null
          : User.fromJson(json['acceptor'] as Map<String, dynamic>),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      publicId: json['public_id'] as int?,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']),
      priorityLevel:
          $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority_level']),
      star: json['star'] as int?,
      privateId: json['private_id'] as int?,
    )..id = json['id'] as int?;

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
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
      'status': _$TaskStatusEnumMap[instance.status],
      'priority_level': _$TaskPriorityEnumMap[instance.priorityLevel],
      'private_id': instance.privateId,
      'public_id': instance.publicId,
      'id': instance.id,
      'star': instance.star,
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

const _$TaskPriorityEnumMap = {
  TaskPriority.HIGH: 'high',
  TaskPriority.NORMAL: 'normal',
  TaskPriority.LOW: 'low',
  TaskPriority.UNKNOWN: 'unknown',
};
