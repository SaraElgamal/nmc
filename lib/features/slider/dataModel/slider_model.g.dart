// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataSlider.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataSlider _$DataSliderFromJson(Map<String, dynamic> json) => DataSlider(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$DataSliderToJson(DataSlider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image_url': instance.image_url,
    };
