

import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()

class CategoryModel {

  List<Data>? data;

  CategoryModel(this.data);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);


}
@JsonSerializable()
class Data {

  String? category;
  int? MedicalNetwork;
  String? image;
  String? image_url;

  Data({this.category, this.MedicalNetwork, this.image, this.image_url});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}