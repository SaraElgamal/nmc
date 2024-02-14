// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefinitionCard _$DefinitionCardFromJson(Map<String, dynamic> json) =>
    DefinitionCard(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DefinitionCardToJson(DefinitionCard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataDefinition _$DataDefinitionFromJson(Map<String, dynamic> json) =>
    DataDefinition(
      id: json['id'] as int?,
      content: json['content'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$DataDefinitionToJson(DataDefinition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image_url': instance.image_url,
    };

EngagementT _$EngagementTFromJson(Map<String, dynamic> json) => EngagementT(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataEngagement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EngagementTToJson(EngagementT instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataEngagement _$DataEngagementFromJson(Map<String, dynamic> json) =>
    DataEngagement(
      id: json['id'] as int?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$DataEngagementToJson(DataEngagement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.image_url,
    };

OurCustomers _$OurCustomersFromJson(Map<String, dynamic> json) => OurCustomers(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$OurCustomersToJson(OurCustomers instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

CardFeaturesImages _$CardFeaturesImagesFromJson(Map<String, dynamic> json) =>
    CardFeaturesImages(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataCardFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardFeaturesImagesToJson(CardFeaturesImages instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataCardFeatures _$DataCardFeaturesFromJson(Map<String, dynamic> json) =>
    DataCardFeatures(
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$DataCardFeaturesToJson(DataCardFeatures instance) =>
    <String, dynamic>{
      'image_url': instance.image_url,
    };

CardFeaturesContent _$CardFeaturesContentFromJson(Map<String, dynamic> json) =>
    CardFeaturesContent(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DataCardFeaturesContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardFeaturesContentToJson(
        CardFeaturesContent instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataCardFeaturesContent _$DataCardFeaturesContentFromJson(
        Map<String, dynamic> json) =>
    DataCardFeaturesContent(
      id: json['id'] as int?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$DataCardFeaturesContentToJson(
        DataCardFeaturesContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };
