class UpdateTaskRequest {
  String? name;
  int? executorId;
  String? startTime;
  String? endTime;
  int? quantity;
  int? price;
  String? unit;
  String priorityLevel;
  String? description;

  UpdateTaskRequest(
      {this.name,
      this.executorId,
      this.startTime,
      this.endTime,
      this.quantity,
      this.unit,
      this.description,
      this.priorityLevel = "low",
      this.price});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['executor_id'] = this.executorId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['unit'] = this.unit;
    data['priority_level'] = this.priorityLevel;
    data['description'] = this.description;
    return data;
  }
}
