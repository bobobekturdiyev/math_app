// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDto _$VideoDtoFromJson(Map<String, dynamic> json) => VideoDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fileUrl: json['file_url'] as String,
      status: json['status'] as String,
      position: (json['position'] as num).toInt(),
      joinId: (json['join_id'] as num).toInt(),
    );

Map<String, dynamic> _$VideoDtoToJson(VideoDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'file_url': instance.fileUrl,
      'status': instance.status,
      'position': instance.position,
      'join_id': instance.joinId,
    };
