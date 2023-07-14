import 'package:coteccons_app/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_task_response.g.dart';

@JsonSerializable()
class ListTaskResponse {
  List<Task> tasks;

  ListTaskResponse({this.tasks = const []});

  factory ListTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTaskResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListTaskResponseToJson(this);
}
