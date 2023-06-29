// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProjectResponse _$ListProjectResponseFromJson(Map<String, dynamic> json) =>
    ListProjectResponse(
      (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProjectResponseToJson(
        ListProjectResponse instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
