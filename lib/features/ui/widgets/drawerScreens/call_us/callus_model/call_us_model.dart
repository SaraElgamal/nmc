


import 'package:json_annotation/json_annotation.dart';

part 'call_us_model.g.dart';

@JsonSerializable()


class MessageSend {
  String? message;
  String? Name;
  String? Email;
  String? PhoneNumber;
  String? error;
  String? TheMessage;


  MessageSend({this.message, this.Name, this.Email, this.PhoneNumber,this.error,this.TheMessage});

  factory MessageSend.fromJson(Map<String, dynamic> json) => _$MessageSendFromJson(json);

  Map<String, dynamic> toJson() => _$MessageSendToJson(this);
  }

