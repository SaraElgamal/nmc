// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageSend _$MessageSendFromJson(Map<String, dynamic> json) => MessageSend(
      message: json['message'] as String?,
      Name: json['Name'] as String?,
      Email: json['Email'] as String?,
      PhoneNumber: json['PhoneNumber'] as String?,
      error: json['error'] as String?,
      TheMessage: json['TheMessage'] as String?,
    );

Map<String, dynamic> _$MessageSendToJson(MessageSend instance) =>
    <String, dynamic>{
      'message': instance.message,
      'Name': instance.Name,
      'Email': instance.Email,
      'PhoneNumber': instance.PhoneNumber,
      'error': instance.error,
      'TheMessage': instance.TheMessage,
    };
