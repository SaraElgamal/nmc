// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesModel _$ServicesModelFromJson(Map<String, dynamic> json) =>
    ServicesModel(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServicesModelToJson(ServicesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataServices _$DataServicesFromJson(Map<String, dynamic> json) => DataServices(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$DataServicesToJson(DataServices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image_url': instance.image_url,
    };
