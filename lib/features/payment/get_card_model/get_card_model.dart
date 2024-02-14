


import 'dart:io';

import 'package:json_annotation/json_annotation.dart';


part 'get_card_model.g.dart';



@JsonSerializable()


class GetCardAfter {
  CardM? card;
  List<FamilyMembers>? family_members;

  GetCardAfter({this.card,  this.family_members});

  factory GetCardAfter.fromJson(Map<String, dynamic> json) => _$GetCardAfterFromJson(json);

  Map<String, dynamic> toJson() => _$GetCardAfterToJson(this);


}
@JsonSerializable()
class CardM {
  int? id;
  String? state;
  String? full_name;
  String? invoices_key;


  String? address;
  String? date_of_birth;
  String? national_id;
  String? phone_number;
  String? job;
  String? card_type;


  String? image_url;


  String? image;

  String? home_phone;
  String? company_name;
  String? email;
  String? work_location;
  String? created;
  int? numberOfYears;
  String? expiryDate;

  CardM({this.id,
    this.state,
    this.full_name,
    this.address,
    this.date_of_birth,
    this.national_id,
    this.phone_number,

    this.job,
    this.card_type,
    this.image_url,
    this.image,
    this.home_phone,
    this.company_name,
    this.email,
    this.work_location,
    this.invoices_key,
    this.created,
    this.numberOfYears,
    this.expiryDate,


  });

  factory CardM.fromJson(Map<String, dynamic> json) => _$CardMFromJson(json);

  Map<String, dynamic> toJson() => _$CardMToJson(this);

}
@JsonSerializable()
class FamilyMembers {
  String? name;
  String? age;
  String? national_id;
  String? gender;
  String? image_url;

  FamilyMembers(
      {this.name, this.age, this.national_id, this.gender, this.image_url});

  factory FamilyMembers.fromJson(Map<String, dynamic> json) => _$FamilyMembersFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyMembersToJson(this);


}