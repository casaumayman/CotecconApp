// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageInfo _$ImageInfoFromJson(Map<String, dynamic> json) => ImageInfo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] as String?,
      fullFile: json['full_file'] as String?,
    );

Map<String, dynamic> _$ImageInfoToJson(ImageInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'full_file': instance.fullFile,
    };
