

import 'package:json_annotation/json_annotation.dart';

part 'services_model.g.dart';

@JsonSerializable()

class ServicesModel {
  bool? status;
  String? errNum;
  String? msg;

  List<DataServices>? data;

  ServicesModel({this.status, this.errNum, this.msg, this.data});

  factory ServicesModel.fromJson(Map<String, dynamic> json) => _$ServicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesModelToJson(this);


}

@JsonSerializable()
class DataServices {
  int? id;
  String? title;
  String? subtitle;
  String? image_url;

  DataServices({this.id, this.title, this.subtitle, this.image_url});


  factory DataServices.fromJson(Map<String, dynamic> json) => _$DataServicesFromJson(json);

  Map<String, dynamic> toJson() => _$DataServicesToJson(this);
}