
import 'package:json_annotation/json_annotation.dart';

part 'all_cat_item_model.g.dart';

@JsonSerializable()

class AllCategoriesItemModel {
  bool? status;
  String? errNum;
  String? msg;
  List<DataAllCatDetails>? data;

  AllCategoriesItemModel({this.status, this.errNum, this.msg, this.data});


  factory AllCategoriesItemModel.fromJson(Map<String, dynamic> json) => _$AllCategoriesItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoriesItemModelToJson(this);

}

@JsonSerializable()
class DataAllCatDetails {
  int? id;
  String? category;
  String? serviceProvider;
  String? governorate;
  String? region;
  String? discountPercentage;
  String? specialization;
  String? typeOfserviceProvider;
  String? address;
  String? phoneNumber;
  String? phoneNumbe2r;
  String? hotLine;
  String? appointments;
  String? image_url;

  int? state;

  DataAllCatDetails(
      {this.id,
        this.category,
        this.serviceProvider,
        this.governorate,
        this.region,
        this.discountPercentage,
        this.specialization,
        this.typeOfserviceProvider,

        this.address,
        this.phoneNumber,
        this.phoneNumbe2r,
        this.hotLine,
        this.appointments,

        this.image_url,

        this.state});


  factory DataAllCatDetails.fromJson(Map<String, dynamic> json) => _$DataAllCatDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DataAllCatDetailsToJson(this);
}