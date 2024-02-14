

import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()



class PaymentMethod {
  String? status;
  List<DataPayment>? data;

  PaymentMethod({this.status, this.data});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);

}
@JsonSerializable()
class DataPayment {
  int? paymentId;
  String? name_en;
  String? name_ar;
  String? redirect;
  String? logo;

  DataPayment(
      {this.paymentId, this.name_en, this.name_ar, this.redirect, this.logo});
  factory DataPayment.fromJson(Map<String, dynamic> json) => _$DataPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$DataPaymentToJson(this);


}