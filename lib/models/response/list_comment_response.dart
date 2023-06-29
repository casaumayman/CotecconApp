import 'package:coteccons_app/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_comment_response.g.dart';

@JsonSerializable()
class ListCommentResponse {
  List<Comment>? comments;

  ListCommentResponse(this.comments);

  factory ListCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCommentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListCommentResponseToJson(this);
}
