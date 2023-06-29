import 'package:flutter_getx_boilerplate/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_executor_response.g.dart';

@JsonSerializable()
class ListExecutorResponse {
  List<Executor> executors;

  ListExecutorResponse(this.executors);

  factory ListExecutorResponse.fromJson(Map<String, dynamic> json) =>
      _$ListExecutorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListExecutorResponseToJson(this);
}
