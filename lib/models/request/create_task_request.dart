class CreateTaskRequest {
  String? name;
  int? projectId;
  int? executorId;
  String? startTime;
  String? endTime;
  int? quantity;
  int? price;
  String? unit;
  String priorityLevel;
  String? description;
  int? parentTaskId;

  CreateTaskRequest(
      {this.name,
      this.projectId,
      this.executorId,
      this.startTime,
      this.endTime,
      this.quantity,
      this.unit,
      this.description,
      this.priorityLevel = "low",
      this.price,
      this.parentTaskId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['project_id'] = this.projectId;
    data['executor_id'] = this.executorId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['unit'] = this.unit;
    data['priority_level'] = this.priorityLevel;
    data['description'] = this.description;
    data['parent_task_id'] = this.parentTaskId;
    return data;
  }
}
