import 'package:json_annotation/json_annotation.dart';

import '../../Register/register_model/register_model.dart';

part 'login_model.g.dart';

@JsonSerializable()

class LoginModel {
  bool? status;
  String? errNum;
  String? msg;
  Client? client;

  LoginModel({this.status, this.errNum, this.msg, this.client});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

