import 'package:coteccons_app/models/comment_creator.dart';
import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  int? id;
  Task? task;
  String? msg;
  DateTime? time;
  CommentCreator creator;

  Comment(this.id, this.task, this.msg, this.time, this.creator);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
