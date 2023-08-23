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
  @JsonValue("approved")
  APPROVED,
  @JsonValue("implementing")
  IMPLEMENTING,
  @JsonValue("unknown")
  UNKNOWN,
}

enum TaskPriority {
  @JsonValue("high")
  HIGH,
  @JsonValue("normal")
  NORMAL,
  @JsonValue("low")
  LOW,
  @JsonValue("unknown")
  UNKNOWN
}

@JsonSerializable()
class SubTask {
  int id;
  String? name;

  SubTask({required this.id, this.name});

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);

  Map<String, dynamic> toJson() => _$SubTaskToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TaskDetail {
  int? id;
  String? code;
  String? name;
  int? projectId;
  String? projectName;
  Project? project;
  User? creator;
  User? executor;
  User? reporter;
  User? acceptor;
  String? startTime;
  String? endTime;
  int? quantity;
  int? price;
  String? unit;
  String? description;
  TaskStatus? status;
  TaskPriority? priorityLevel;
  int? star;
  List<ImageInfo>? ownerImages;
  List<ImageInfo>? executorImages;
  List<Comment>? comments;
  SubTask? parentTask;
  SubTask? childTask;

  TaskDetail(
      {this.id,
      this.code,
      this.name,
      this.projectId,
      this.projectName,
      this.project,
      this.creator,
      this.executor,
      this.reporter,
      this.acceptor,
      this.startTime,
      this.endTime,
      this.quantity,
      this.price,
      this.unit,
      this.description,
      this.status,
      this.priorityLevel,
      this.star,
      this.ownerImages,
      this.executorImages,
      this.parentTask,
      this.childTask,
      this.comments});

  factory TaskDetail.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailToJson(this);
}
