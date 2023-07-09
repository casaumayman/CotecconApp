import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_private_task_response.g.dart';

@JsonSerializable()
class ListPrivateTaskResponse {
  List<PrivateTask> tasks;

  ListPrivateTaskResponse(this.tasks);

  factory ListPrivateTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPrivateTaskResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListPrivateTaskResponseToJson(this);
}
