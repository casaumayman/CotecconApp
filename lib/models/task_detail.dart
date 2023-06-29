import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_detail.g.dart';

enum TaskStatus {
  @JsonValue("requested")
  REQUESTED,
  @JsonValue("accepted")
  ACCEPTED,
  @JsonValue("rejected")
  REJECTED,
  @JsonValue("cancel")
  CANCELED,
  @JsonValue("completed")
  COMPLETED,
  @JsonValue("created")
  CREATED,
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TaskDetail {
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
  int? priorityLevel;
  TaskStatus status;
  List<ImageInfo>? ownerImages;
  List<ImageInfo>? executorImages;

  TaskDetail(
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
      this.status);

  factory TaskDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailToJson(this);
}
