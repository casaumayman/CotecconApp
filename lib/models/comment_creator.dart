import 'package:json_annotation/json_annotation.dart';

part 'comment_creator.g.dart';

@JsonSerializable()
class CommentCreator {
  String? name;
  int id;

  CommentCreator(this.name, this.id);

  factory CommentCreator.fromJson(Map<String, dynamic> json) =>
      _$CommentCreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CommentCreatorToJson(this);
}
