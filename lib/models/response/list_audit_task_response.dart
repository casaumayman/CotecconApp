import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_audit_task_response.g.dart';

@JsonSerializable()
class ListAuditTaskResponse {
  List<AuditTask> tasks;

  ListAuditTaskResponse({this.tasks = const []});

  factory ListAuditTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAuditTaskResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListAuditTaskResponseToJson(this);
}
