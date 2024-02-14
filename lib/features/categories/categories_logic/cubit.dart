


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/core/constant/const/const.dart';

import 'package:n_m_c/features/categories/categories_logic/state.dart';
import 'package:n_m_c/features/categories/categories_model/categories_model.dart';

import '../../../core/data_base/filtration_model.dart';
import '../../../core/utils/toast.dart';
import 'categories_repo.dart';


class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesRepository categoriesRepo;

  CategoriesCubit(this.categoriesRepo) : super(InitialCategoriesState());

  static CategoriesCubit get(context) => BlocProvider.of(context);
 List<Data>? data = [];
  List <String>  allSearch = [] ;
  Future<bool> result = InternetConnectionChecker().hasConnection;

  getCategoriesNetwork() async

  {
    emit(GetLoadingCategoriesState());
    await categoriesRepo.getCategory().then((category) => {

      data = category.data,
for (int x = 0 ; x < data!.length ; x++) {
  allSearch.add(data![x].category.toString()),
},

    emit(GetSuccessCategoriesState(
    )),

    }).catchError((error)  async {


      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
        emit(GetErrorCategoriesState());
      }
      });

  }


  List<Map<String, dynamic>> region = [] ;
  List<Map<String, dynamic>> governNames = [] ;
  Future<void> loadData() async {
    String jsonString =  await rootBundle
        .loadString('assets/DataSearch.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);

    governNames = List<Map<String, dynamic>>.from(jsonData['Governorate']);
    region = List<Map<String, dynamic>>.from(jsonData['Regions']);

    emit(GetSuccessgetFilterDataState());
  }
  List nameGovern = [] ;
  List getGovernorateNames() {
    nameGovern.addAll(governNames.map((governorate) => governorate['name']).toList());
    return nameGovern;
  }
  List getRegionsForGovernorate(String governorate) {
    String governorateId = governNames
        .firstWhere((element) => element['name'] == governorate)['id'];

    return region
        .where((region) => region['governorate_id'] == governorateId)
        .map((region) => region['city_name_ar'])
        .toList();
  }
List<String> nameOnly = [ ];
List<String>? idGovOnly = [ ];
  void fetchData() async {
    await loadGovernorates()
        .then((value)  {
      for (int x = 0 ; x < value.length ; x++) {
        nameOnly.add(value[x].name.toString());
        idGovOnly!.add(value[x].id.toString());
    }

    });
  await loadRegions()
        .then((value) {
      for (int x = 0; x < value.length; x++) {
     //   if(value[x].governorateId == idGovOnly![x])
      //  region!.add(value[x].cityNameAr.toString());
      }
    });

  }


  }




