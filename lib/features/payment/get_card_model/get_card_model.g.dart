// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCardAfter _$GetCardAfterFromJson(Map<String, dynamic> json) => GetCardAfter(
      card: json['card'] == null
          ? null
          : CardM.fromJson(json['card'] as Map<String, dynamic>),
      family_members: (json['family_members'] as List<dynamic>?)
          ?.map((e) => FamilyMembers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCardAfterToJson(GetCardAfter instance) =>
    <String, dynamic>{
      'card': instance.card,
      'family_members': instance.family_members,
    };

CardM _$CardMFromJson(Map<String, dynamic> json) => CardM(
      id: json['id'] as int?,
      state: json['state'] as String?,
      full_name: json['full_name'] as String?,
      address: json['address'] as String?,
      date_of_birth: json['date_of_birth'] as String?,
      national_id: json['national_id'] as String?,
      phone_number: json['phone_number'] as String?,
      job: json['job'] as String?,
      card_type: json['card_type'] as String?,
      image_url: json['image_url'] as String?,
      image: json['image'] as String?,
      home_phone: json['home_phone'] as String?,
      company_name: json['company_name'] as String?,
      email: json['email'] as String?,
      work_location: json['work_location'] as String?,
      invoices_key: json['invoices_key'] as String?,
      created: json['created'] as String?,
      numberOfYears: json['numberOfYears'] as int?,
      expiryDate: json['expiryDate'] as String?,
    );

Map<String, dynamic> _$CardMToJson(CardM instance) => <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'full_name': instance.full_name,
      'invoices_key': instance.invoices_key,
      'address': instance.address,
      'date_of_birth': instance.date_of_birth,
      'national_id': instance.national_id,
      'phone_number': instance.phone_number,
      'job': instance.job,
      'card_type': instance.card_type,
      'image_url': instance.image_url,
      'image': instance.image,
      'home_phone': instance.home_phone,
      'company_name': instance.company_name,
      'email': instance.email,
      'work_location': instance.work_location,
      'created': instance.created,
      'numberOfYears': instance.numberOfYears,
      'expiryDate': instance.expiryDate,
    };

FamilyMembers _$FamilyMembersFromJson(Map<String, dynamic> json) =>
    FamilyMembers(
      name: json['name'] as String?,
      age: json['age'] as String?,
      national_id: json['national_id'] as String?,
      gender: json['gender'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$FamilyMembersToJson(FamilyMembers instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'national_id': instance.national_id,
      'gender': instance.gender,
      'image_url': instance.image_url,
    };
