// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTask _$SubTaskFromJson(Map<String, dynamic> json) => SubTask(
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SubTaskToJson(SubTask instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TaskDetail _$TaskDetailFromJson(Map<String, dynamic> json) => TaskDetail(
      id: json['id'] as int?,
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
      reporter: json['reporter'] == null
          ? null
          : User.fromJson(json['reporter'] as Map<String, dynamic>),
      acceptor: json['acceptor'] == null
          ? null
          : User.fromJson(json['acceptor'] as Map<String, dynamic>),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      quantity: json['quantity'] as int?,
      price: json['price'] as int?,
      unit: json['unit'] as String?,
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']),
      priorityLevel:
          $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority_level']),
      star: json['star'] as int?,
      ownerImages: (json['owner_images'] as List<dynamic>?)
          ?.map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      executorImages: (json['executor_images'] as List<dynamic>?)
          ?.map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentTask: json['parent_task'] == null
          ? null
          : SubTask.fromJson(json['parent_task'] as Map<String, dynamic>),
      childTask: json['child_task'] == null
          ? null
          : SubTask.fromJson(json['child_task'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaskDetailToJson(TaskDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'project_id': instance.projectId,
      'project_name': instance.projectName,
      'project': instance.project,
      'creator': instance.creator,
      'executor': instance.executor,
      'reporter': instance.reporter,
      'acceptor': instance.acceptor,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'quantity': instance.quantity,
      'price': instance.price,
      'unit': instance.unit,
      'description': instance.description,
      'status': _$TaskStatusEnumMap[instance.status],
      'priority_level': _$TaskPriorityEnumMap[instance.priorityLevel],
      'star': instance.star,
      'owner_images': instance.ownerImages,
      'executor_images': instance.executorImages,
      'comments': instance.comments,
      'parent_task': instance.parentTask,
      'child_task': instance.childTask,
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
