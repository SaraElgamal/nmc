// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'client': instance.client,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      LastName: json['LastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      authToken: json['authToken'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'LastName': instance.LastName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'authToken': instance.authToken,
      'password': instance.password,
    };
