
import 'package:json_annotation/json_annotation.dart';

part 'excute_payment_model.g.dart';

@JsonSerializable()


class ExcutePayment {
  DataGeneral? data;

  ExcutePayment({this.data});

  factory ExcutePayment.fromJson(Map<String, dynamic> json) => _$ExcutePaymentFromJson(json);

  Map<String, dynamic> toJson() => _$ExcutePaymentToJson(this);

}
@JsonSerializable()
class DataGeneral {
  String? status;
  DataDetail? data;

  DataGeneral({this.status, this.data});

  factory DataGeneral.fromJson(Map<String, dynamic> json) => _$DataGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$DataGeneralToJson(this);

}
@JsonSerializable()
class DataDetail {
  int? invoice_id;
  String? invoice_key;
  PaymentData? payment_data;

  DataDetail({this.invoice_id, this.invoice_key, this.payment_data});

  factory DataDetail.fromJson(Map<String, dynamic> json) => _$DataDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailToJson(this);

}
@JsonSerializable()
class PaymentData {
  String? fawryCode;
  String? expireDate;
  String? redirectTo;
  int? meezaReference;
  int? amanCode;
  int? masaryCode;

  PaymentData({this.fawryCode, this.expireDate,this.redirectTo,this.meezaReference,this.amanCode,this.masaryCode});

  factory PaymentData.fromJson(Map<String, dynamic> json) => _$PaymentDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDataToJson(this);


}


@JsonSerializable()
class BodyOfExcutePayment {
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? address;
  String? card_type;
  int? price;
  int? payment_method_id;
  int? cartTotal;


  BodyOfExcutePayment({
      this.first_name,
      this.last_name,
      this.email,
      this.phone,
      this.address,
      this.card_type,
      this.price,
      this.payment_method_id,
      this.cartTotal});

  factory BodyOfExcutePayment.fromJson(Map<String, dynamic> json) => _$BodyOfExcutePaymentFromJson(json);

  Map<String, dynamic> toJson() => _$BodyOfExcutePaymentToJson(this);

}