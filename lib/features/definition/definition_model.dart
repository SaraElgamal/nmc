import 'package:json_annotation/json_annotation.dart';

part 'definition_model.g.dart';

@JsonSerializable()



class DefinitionCard {
  bool? status;
  String? errNum;
  String? msg;
  List<DataDefinition>? data;

  DefinitionCard({this.status, this.errNum, this.msg, this.data});


  factory DefinitionCard.fromJson(Map<String, dynamic> json) => _$DefinitionCardFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionCardToJson(this);


}

@JsonSerializable()

class DataDefinition {
  int? id;
  String? content;
  String? image_url;

  DataDefinition({this.id, this.content, this.image_url});


  factory DataDefinition.fromJson(Map<String, dynamic> json) => _$DataDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$DataDefinitionToJson(this);

}




@JsonSerializable()
class EngagementT {
  bool? status;
  String? errNum;
  String? msg;
  List<DataEngagement>? data;

  EngagementT({this.status, this.errNum, this.msg, this.data});


  factory EngagementT.fromJson(Map<String, dynamic> json) => _$EngagementTFromJson(json);

  Map<String, dynamic> toJson() => _$EngagementTToJson(this);

}



/// engagement
@JsonSerializable()
class DataEngagement {
  int? id;
  String? image_url;

  DataEngagement({this.id, this.image_url});

  factory DataEngagement.fromJson(Map<String, dynamic> json) => _$DataEngagementFromJson(json);

  Map<String, dynamic> toJson() => _$DataEngagementToJson(this);


}

/// OurCustomers
 @JsonSerializable()
class OurCustomers {
  bool? status;
  String? errNum;
  String? msg;
  List? data;

  OurCustomers({this.status, this.errNum, this.msg, this.data});



  factory OurCustomers.fromJson(Map<String, dynamic> json) => _$OurCustomersFromJson(json);

  Map<String, dynamic> toJson() => _$OurCustomersToJson(this);

 }

/// card f photo

@JsonSerializable()
class CardFeaturesImages {
  bool? status;
  String? errNum;
  String? msg;
  List<DataCardFeatures>? data;

  CardFeaturesImages({this.status, this.errNum, this.msg, this.data});


  factory CardFeaturesImages.fromJson(Map<String, dynamic> json) => _$CardFeaturesImagesFromJson(json);

  Map<String, dynamic> toJson() => _$CardFeaturesImagesToJson(this);


}


@JsonSerializable()
class DataCardFeatures {
  String? image_url;

  DataCardFeatures({this.image_url});

  factory DataCardFeatures.fromJson(Map<String, dynamic> json) => _$DataCardFeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$DataCardFeaturesToJson(this);

}



/// card fetures content

@JsonSerializable()
class CardFeaturesContent {
  bool? status;
  String? errNum;
  String? msg;
  List<DataCardFeaturesContent>? data;

  CardFeaturesContent({this.status, this.errNum, this.msg, this.data});

  factory CardFeaturesContent.fromJson(Map<String, dynamic> json) => _$CardFeaturesContentFromJson(json);

  Map<String, dynamic> toJson() => _$CardFeaturesContentToJson(this);


}

@JsonSerializable()
class DataCardFeaturesContent {
  int? id;
  String? content;

  DataCardFeaturesContent({this.id, this.content});

  factory DataCardFeaturesContent.fromJson(Map<String, dynamic> json) => _$DataCardFeaturesContentFromJson(json);

  Map<String, dynamic> toJson() => _$DataCardFeaturesContentToJson(this);

}