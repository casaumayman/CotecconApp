import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_project_response.g.dart';

@JsonSerializable()
class ListProjectResponse {
  List<Project> projects;

  ListProjectResponse(this.projects);

  factory ListProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProjectResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListProjectResponseToJson(this);
}
