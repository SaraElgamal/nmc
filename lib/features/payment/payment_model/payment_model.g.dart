// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataPayment _$DataPaymentFromJson(Map<String, dynamic> json) => DataPayment(
      paymentId: json['paymentId'] as int?,
      name_en: json['name_en'] as String?,
      name_ar: json['name_ar'] as String?,
      redirect: json['redirect'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$DataPaymentToJson(DataPayment instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'name_en': instance.name_en,
      'name_ar': instance.name_ar,
      'redirect': instance.redirect,
      'logo': instance.logo,
    };
