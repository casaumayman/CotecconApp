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
  @JsonValue("implementing")
  IMPLEMENTING,
  @JsonValue("unknown")
  UNKNOWN,
}

enum TaskPriority {
  @JsonValue("high")
  HIGHT,
  @JsonValue("normal")
  NORMAL,
  @JsonValue("low")
  LOW,
  @JsonValue("unknown")
  UNKNOWN
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
  TaskPriority? priorityLevel;
  TaskStatus status;
  List<ImageInfo>? ownerImages;
  List<ImageInfo>? executorImages;
  String? unit;

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
      this.status,
      this.unit);

  factory TaskDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailToJson(this);
}
