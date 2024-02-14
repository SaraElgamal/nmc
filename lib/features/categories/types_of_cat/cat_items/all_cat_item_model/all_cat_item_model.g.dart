// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_cat_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCategoriesItemModel _$AllCategoriesItemModelFromJson(
        Map<String, dynamic> json) =>
    AllCategoriesItemModel(
      status: json['status'] as bool?,
      errNum: json['errNum'] as String?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataAllCatDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCategoriesItemModelToJson(
        AllCategoriesItemModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errNum': instance.errNum,
      'msg': instance.msg,
      'data': instance.data,
    };

DataAllCatDetails _$DataAllCatDetailsFromJson(Map<String, dynamic> json) =>
    DataAllCatDetails(
      id: json['id'] as int?,
      category: json['category'] as String?,
      serviceProvider: json['serviceProvider'] as String?,
      governorate: json['governorate'] as String?,
      region: json['region'] as String?,
      discountPercentage: json['discountPercentage'] as String?,
      specialization: json['specialization'] as String?,
      typeOfserviceProvider: json['typeOfserviceProvider'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      phoneNumbe2r: json['phoneNumbe2r'] as String?,
      hotLine: json['hotLine'] as String?,
      appointments: json['appointments'] as String?,
      image_url: json['image_url'] as String?,
      state: json['state'] as int?,
    );

Map<String, dynamic> _$DataAllCatDetailsToJson(DataAllCatDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'serviceProvider': instance.serviceProvider,
      'governorate': instance.governorate,
      'region': instance.region,
      'discountPercentage': instance.discountPercentage,
      'specialization': instance.specialization,
      'typeOfserviceProvider': instance.typeOfserviceProvider,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'phoneNumbe2r': instance.phoneNumbe2r,
      'hotLine': instance.hotLine,
      'appointments': instance.appointments,
      'image_url': instance.image_url,
      'state': instance.state,
    };
