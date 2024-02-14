// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excute_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExcutePayment _$ExcutePaymentFromJson(Map<String, dynamic> json) =>
    ExcutePayment(
      data: json['data'] == null
          ? null
          : DataGeneral.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExcutePaymentToJson(ExcutePayment instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataGeneral _$DataGeneralFromJson(Map<String, dynamic> json) => DataGeneral(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : DataDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataGeneralToJson(DataGeneral instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataDetail _$DataDetailFromJson(Map<String, dynamic> json) => DataDetail(
      invoice_id: json['invoice_id'] as int?,
      invoice_key: json['invoice_key'] as String?,
      payment_data: json['payment_data'] == null
          ? null
          : PaymentData.fromJson(json['payment_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDetailToJson(DataDetail instance) =>
    <String, dynamic>{
      'invoice_id': instance.invoice_id,
      'invoice_key': instance.invoice_key,
      'payment_data': instance.payment_data,
    };

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) => PaymentData(
      fawryCode: json['fawryCode'] as String?,
      expireDate: json['expireDate'] as String?,
      redirectTo: json['redirectTo'] as String?,
      meezaReference: json['meezaReference'] as int?,
      amanCode: json['amanCode'] as int?,
      masaryCode: json['masaryCode'] as int?,
    );

Map<String, dynamic> _$PaymentDataToJson(PaymentData instance) =>
    <String, dynamic>{
      'fawryCode': instance.fawryCode,
      'expireDate': instance.expireDate,
      'redirectTo': instance.redirectTo,
      'meezaReference': instance.meezaReference,
      'amanCode': instance.amanCode,
      'masaryCode': instance.masaryCode,
    };

BodyOfExcutePayment _$BodyOfExcutePaymentFromJson(Map<String, dynamic> json) =>
    BodyOfExcutePayment(
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      card_type: json['card_type'] as String?,
      price: json['price'] as int?,
      payment_method_id: json['payment_method_id'] as int?,
      cartTotal: json['cartTotal'] as int?,
    );

Map<String, dynamic> _$BodyOfExcutePaymentToJson(
        BodyOfExcutePayment instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'card_type': instance.card_type,
      'price': instance.price,
      'payment_method_id': instance.payment_method_id,
      'cartTotal': instance.cartTotal,
    };
