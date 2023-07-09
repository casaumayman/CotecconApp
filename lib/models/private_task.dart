import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'private_task.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PrivateTask {
  int? id;
  String? code;
  String? name;
  int? projectId;
  String? projectName;
  Project? project;
  int? executorId;
  String? executorName;
  Executor? executor;
  String? startTime;
  String? endTime;
  int? quantity;
  int? price;
  String? description;
  TaskPriority? priorityLevel;
  TaskStatus status;
  List<ImageInfo>? ownerImages;
  List<ImageInfo>? executorImages;
  String? unit;

  PrivateTask(
      this.id,
      this.code,
      this.description,
      this.endTime,
      this.executor,
      this.executorId,
      this.executorImages,
      this.executorName,
      this.name,
      this.ownerImages,
      this.price,
      this.priorityLevel,
      this.project,
      this.projectId,
      this.projectName,
      this.quantity,
      this.startTime,
      this.status,
      this.unit);

  factory PrivateTask.fromJson(Map<String, dynamic> json) =>
      _$PrivateTaskFromJson(json);

  Map<String, dynamic> toJson() => _$PrivateTaskToJson(this);
}
