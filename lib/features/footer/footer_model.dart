


import 'package:json_annotation/json_annotation.dart';

part 'footer_model.g.dart';

@JsonSerializable()

class FooterModel {
  bool? status;
  String? errNum;
  String? msg;
  List<DataFooter>? data;

  FooterModel({this.status, this.errNum, this.msg, this.data});

  factory FooterModel.fromJson(Map<String, dynamic> json) => _$FooterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FooterModelToJson(this);
}


@JsonSerializable()
  class DataFooter {
  int? id;
  String? location;
  String? phoneNumber;
  String? email;
  String? landline;
  String? time;

  DataFooter(
  {this.id,
  this.location,
  this.phoneNumber,
  this.email,
  this.landline,
  this.time});

  factory DataFooter.fromJson(Map<String, dynamic> json) => _$DataFooterFromJson(json);

  Map<String, dynamic> toJson() => _$DataFooterToJson(this);

  }