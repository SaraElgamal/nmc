// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FooterModel _$FooterModelFromJson(Map<String, dynamic> json) => FooterModel(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataFooter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FooterModelToJson(FooterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataFooter _$DataFooterFromJson(Map<String, dynamic> json) => DataFooter(
      id: json['id'] as int?,
      location: json['location'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      landline: json['landline'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$DataFooterToJson(DataFooter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'landline': instance.landline,
      'time': instance.time,
    };
