// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['id'] as int?,
      json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      json['msg'] as String?,
      json['time'] == null ? null : DateTime.parse(json['time'] as String),
      CommentCreator.fromJson(json['creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'msg': instance.msg,
      'time': instance.time?.toIso8601String(),
      'creator': instance.creator,
    };
