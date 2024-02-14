import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class Register {
  bool? status;
  String? errNum;
  String? msg;
  Client? client;

  Register({this.status, this.errNum, this.msg, this.client});

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
@JsonSerializable()
  class Client {
  int? id;
  String? firstName;
  String? LastName;
  String? phoneNumber;
  String? email;
  String? authToken;
  String? password;

  Client(
  {this.id,
  this.firstName,
  this.LastName,
  this.phoneNumber,
  this.email,
  this.authToken,
  this.password,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
  }
