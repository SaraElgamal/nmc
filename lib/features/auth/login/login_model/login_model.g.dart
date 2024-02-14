// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'client': instance.client,
    };
