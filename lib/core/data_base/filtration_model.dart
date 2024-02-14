import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<List<Governorate>> loadGovernorates() async {
  String jsonData = await rootBundle.loadString('assets/DataSearch.json');
  Map<String, dynamic> jsonMap = jsonDecode(jsonData);
  List<dynamic> jsonList = jsonMap['Governorate'];
  List<Governorate> governorates =
  jsonList.map((json) => Governorate.fromJson(json)).toList();
  return governorates;
}
Future<List<Regions>> loadRegions() async {
  String jsonData = await rootBundle.loadString('assets/DataSearch.json');
  Map<String, dynamic> jsonMap = jsonDecode(jsonData);
  List<dynamic> jsonList = jsonMap['Regions'];
  List<Regions> regions = jsonList.map((json) => Regions.fromJson(json)).toList();
  return regions;
}
class DataSearch {
  List<Governorate>? governorate;
  List<Regions>? regions;

  DataSearch({this.governorate, this.regions});

  DataSearch.fromJson(Map<String, dynamic> json) {
    if (json['Governorate'] != null) {
      governorate = <Governorate>[];
      json['Governorate'].forEach((v) {
        governorate!.add(new Governorate.fromJson(v));
      });
    }
    if (json['Regions'] != null) {
      regions = <Regions>[];
      json['Regions'].forEach((v) {
        regions!.add(new Regions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.governorate != null) {
      data['Governorate'] = this.governorate!.map((v) => v.toJson()).toList();
    }
    if (this.regions != null) {
      data['Regions'] = this.regions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Governorate {
  String? id;
  String? name;

  Governorate({this.id, this.name});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Regions {
  String? id;
  String? governorateId;
  String? cityNameAr;
  String? cityNameEn;

  Regions({this.id, this.governorateId, this.cityNameAr, this.cityNameEn});

  Regions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    cityNameAr = json['city_name_ar'];
    cityNameEn = json['city_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['governorate_id'] = this.governorateId;
    data['city_name_ar'] = this.cityNameAr;
    data['city_name_en'] = this.cityNameEn;
    return data;
  }
}