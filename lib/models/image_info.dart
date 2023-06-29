import 'package:json_annotation/json_annotation.dart';

part 'image_info.g.dart';

@JsonSerializable()
class ImageInfo {
  int? id;
  String? name;
  String? thumbnail;
  String? fullFile;

  ImageInfo({this.id, this.name, this.thumbnail, this.fullFile});

  factory ImageInfo.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageInfoToJson(this);
}
