import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Task {
  String? code;
  String? name;
  int? projectId;
  String? projectName;
  Project? project;
  User? creator;
  User? executor;
  User? acceptor;
  String? startTime;
  String? endTime;
  TaskStatus? status;
  TaskPriority? priorityLevel;
  int? privateId;
  int? publicId;
  int? id;

  Task(
      {this.code,
      this.name,
      this.projectId,
      this.projectName,
      this.project,
      this.creator,
      this.executor,
      this.acceptor,
      this.startTime,
      this.endTime,
      this.publicId,
      this.status,
      this.priorityLevel,
      this.privateId}) {
    this.id = this.publicId ?? this.privateId;
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
