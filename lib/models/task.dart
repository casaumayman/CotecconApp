import 'package:coteccons_app/models/models.dart';

class Task {
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
  String? priorityLevel;

  Task(
      {this.id,
      this.code,
      this.name,
      this.projectId,
      this.projectName,
      this.project,
      this.executorId,
      this.executorName,
      this.executor,
      this.startTime,
      this.endTime,
      this.quantity,
      this.price,
      this.description,
      this.priorityLevel});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    projectId = json['project_id'];
    projectName = json['project_name'];
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    executorId = json['executor_id'];
    executorName = json['executor_name'];
    executor = json['executor'] != null
        ? new Executor.fromJson(json['executor'])
        : null;
    startTime = json['start_time'];
    endTime = json['end_time'];
    quantity = json['quantity'];
    price = json['price'];
    description = json['description'];
    priorityLevel = json['priority_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['executor_id'] = this.executorId;
    data['executor_name'] = this.executorName;
    if (this.executor != null) {
      data['executor'] = this.executor!.toJson();
    }
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['description'] = this.description;
    data['priority_level'] = this.priorityLevel;
    return data;
  }
}
