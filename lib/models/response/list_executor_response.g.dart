// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_executor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListExecutorResponse _$ListExecutorResponseFromJson(
        Map<String, dynamic> json) =>
    ListExecutorResponse(
      (json['executors'] as List<dynamic>)
          .map((e) => Executor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListExecutorResponseToJson(
        ListExecutorResponse instance) =>
    <String, dynamic>{
      'executors': instance.executors,
    };
