
import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  bool? status;
  String? errNum;
  String? msg;
  List<DataSlider>? data;

  SliderModel({this.status, this.errNum, this.msg, this.data});
  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
@JsonSerializable()
class DataSlider {
  int? id;
  String? title;
  String? subtitle;
  String? image_url;

  DataSlider({this.id, this.title, this.subtitle, this.image_url});

  factory DataSlider.fromJson(Map<String, dynamic> json) => _$DataSliderFromJson(json);

  Map<String, dynamic> toJson() => _$DataSliderToJson(this);
}