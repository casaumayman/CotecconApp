// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommentResponse _$ListCommentResponseFromJson(Map<String, dynamic> json) =>
    ListCommentResponse(
      (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCommentResponseToJson(
        ListCommentResponse instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };
