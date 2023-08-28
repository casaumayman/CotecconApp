import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audit_task.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuditTask {
  int? id;
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
  String? description;
  TaskPriority? priorityLevel;
  TaskStatus status;
  int? star;
  List<ImageInfo>? ownerImages;
  List<ImageInfo>? executorImages;

  AuditTask(
      this.id,
      this.code,
      this.description,
      this.endTime,
      this.executor,
      this.executorImages,
      this.name,
      this.ownerImages,
      this.priorityLevel,
      this.project,
      this.projectId,
      this.projectName,
      this.startTime,
      this.status,
      this.acceptor,
      this.creator,
      this.star);

  factory AuditTask.fromJson(Map<String, dynamic> json) =>
      _$AuditTaskFromJson(json);

  Map<String, dynamic> toJson() => _$AuditTaskToJson(this);
}
