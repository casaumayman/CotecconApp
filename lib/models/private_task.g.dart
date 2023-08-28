// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateTask _$PrivateTaskFromJson(Map<String, dynamic> json) => PrivateTask(
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
      json['price'] as int?,
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority_level']),
      json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      json['project_id'] as int?,
      json['project_name'] as String?,
      json['quantity'] as int?,
      json['start_time'] as String?,
      $enumDecode(_$TaskStatusEnumMap, json['status']),
      json['unit'] as String?,
      json['acceptor'] == null
          ? null
          : User.fromJson(json['acceptor'] as Map<String, dynamic>),
      json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      json['star'] as int?,
    );

Map<String, dynamic> _$PrivateTaskToJson(PrivateTask instance) =>
    <String, dynamic>{
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
      'quantity': instance.quantity,
      'price': instance.price,
      'description': instance.description,
      'priority_level': _$TaskPriorityEnumMap[instance.priorityLevel],
      'status': _$TaskStatusEnumMap[instance.status]!,
      'owner_images': instance.ownerImages,
      'executor_images': instance.executorImages,
      'unit': instance.unit,
      'star': instance.star,
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
