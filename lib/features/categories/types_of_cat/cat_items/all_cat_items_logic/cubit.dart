


import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/features/categories/types_of_cat/cat_items/all_cat_items_logic/repo.dart';
import 'package:n_m_c/features/categories/types_of_cat/cat_items/all_cat_items_logic/state.dart';
import 'package:n_m_c/features/ui/widgets/gridItemHospital/hospital_details.dart';
import 'package:n_m_c/features/ui/widgets/gridItemHospital/hospital_grid.dart';

import '../../../../../core/constant/components/components.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../ui/test.dart';
import '../all_cat_item_model/all_cat_item_model.dart';





class ClinicCubit extends Cubit<ClinicStates> {
  ClinicRepository clinicRepo;

  ClinicCubit(this.clinicRepo) : super(InitialClinicState());

  static ClinicCubit get(context) => BlocProvider.of(context);
  Future<bool> result = InternetConnectionChecker().hasConnection;

  List<DataAllCatDetails>? hospital = [];

  getHospitalNetwork() async
  {
    emit(GetLoadingClinicState());
    if ( await result == false) {
      showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
    }
    await clinicRepo.getHospitals()
        .then((hos) => {

      hospital = hos.data,

      DataAllCatDetails().phoneNumbe2r == null || DataAllCatDetails().phoneNumbe2r == 'null' ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState()),
      log('yes its hos'),
      print(hospital![0].category),

    }).catchError((error) async
    {
      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
      }
      emit(GetErrorClinicState()) ;
    });

  }

  List<DataAllCatDetails>? clinica = [];

  getClinicNetwork() async
  {
    emit(GetLoadingClinicState());
    if ( await result == false) {
      showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
    }
      await clinicRepo.getClinic().then((clinic) => {

      clinica = clinic.data,

      DataAllCatDetails().phoneNumbe2r == null || DataAllCatDetails().phoneNumbe2r == 'null' ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState()),
        log('yes its clinic'),
        print(clinica![0].category),

    }).catchError((error) async
    {
      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
      }
     emit(GetErrorClinicState()) ;
    });

  }

  List<DataAllCatDetails>? basareyat = [];
  getBasareyatNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getBasareyat().then((basareyat1) => {

      basareyat = basareyat1.data,

    //  DataBasareyat().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),
log('yes its basareyat'),
      print(basareyat![0].category),

    });

  }
  List<DataAllCatDetails>? pharma = [];
  getPharmacyNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getPharmacy().then((pharmacy) => {

      pharma = pharmacy.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

 }

  List<DataAllCatDetails>? lab1 = [];
  getLabNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getLab().then((lab) => {

      lab1 = lab.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }

  List<DataAllCatDetails>? marakez = [];
  getMarakezNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getMarakez().then((mara) => {

      marakez = mara.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }
  List<DataAllCatDetails>? ashea = [];
  getAsheaNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getAshea().then((ash) => {

      ashea = ash.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }

  List<DataAllCatDetails>? tebeya = [];
  getTebeyaNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getTebeya().then((teb) => {

      tebeya = teb.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }

  List<DataAllCatDetails>? gym = [];
  getGymNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getGym().then((gym1) => {

      gym = gym1.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }

  List<DataAllCatDetails>? beauty = [];
  getBeautyNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getBeauty().then((bea) => {

      beauty = bea.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }

  List<DataAllCatDetails>? hadanat = [];
  getHadanatNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getHadanat().then((hadana) => {

      hadanat = hadana.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }

  List<DataAllCatDetails>? betareya = [];
  getBetareyaNetwork() async
  {
    emit(GetLoadingClinicState());
    await clinicRepo.getBetareya().then((beata) => {

      betareya = beata.data,

      DataAllCatDetails().phoneNumbe2r == null ? checkNull = true : checkNull = false,
      emit(GetSuccessHospitalAllState(
      )),


    });

  }
  String? catHos = '';
  String? catClinic = '';
  String? catPharm = '';
  String? catBasareyat = '';
  String? catLab = '';
  String? catMarakez = '';
  String? catAshea = '';
  String? catTebeya = '';
  String? catGym = '';
  String? catBeauty = '';
  String? catHadanat = '';
  String? catBetareya = '';
List<String?> allofFilter = [] ;
 // List<DataAllCatDetails>? FilterHospital = [];
  getCategoryByRegionAndGov(String governateSelection , String regionSelection ) async
  {

    for(int x = 0 ; x < hospital!.length ; x++) {
      if (hospital![x].governorate == governateSelection &&
          hospital![x].region == regionSelection) {
        catHos = hospital![x].category;
      }
    }
    emit(GetFilterCatState());

    print('gggggggggggg $catHos');
    catHos != '' ?
    allofFilter.add(catHos) : '';

    for(int x = 0 ; x < clinica!.length ; x++) {
      if (clinica![x].governorate == governateSelection &&
          clinica![x].region == regionSelection) {
        catClinic = clinica![x].category;
      }


    }
    emit(GetFilterCatState());
    print('gggggggggggg $catClinic');
    catClinic != '' ?
    allofFilter.add(catClinic) : '';

    for(int x = 0 ; x < basareyat!.length ; x++) {
      if (basareyat![x].governorate == governateSelection &&
          basareyat![x].region == regionSelection) {
        catBasareyat = basareyat![x].category;

      }

    }

    emit(GetFilterCatState());
    print('gggggggggggg $catBasareyat');
    catBasareyat != '' ?
    allofFilter.add(catBasareyat) : '';

    for(int x = 0 ; x < pharma!.length ; x++) {
      if (pharma![x].governorate == governateSelection &&
          pharma![x].region == regionSelection) {
        catPharm = pharma![x].category;

      }

    }
    emit(GetFilterCatState());
    print('gggggggggggg $catPharm');
    catPharm != '' ?
    allofFilter.add(catPharm) : '';


    for(int x = 0 ; x < lab1!.length ; x++) {
      if (lab1![x].governorate == governateSelection &&
          lab1![x].region == regionSelection) {
        catLab = lab1![x].category;

      }

    }
    emit(GetFilterCatState());
    print('gggggggggggg $catLab');
    catLab != '' ?
    allofFilter.add(catLab) : '';

    for(int x = 0 ; x < marakez!.length ; x++) {
      if (marakez![x].governorate == governateSelection &&
          marakez![x].region == regionSelection) {
        catMarakez = marakez![x].category;

      }

    }

    emit(GetFilterCatState());
    print('gggggggggggg $catMarakez');
    catMarakez != '' ?
    allofFilter.add(catMarakez) : '';

    for(int x = 0 ; x < ashea!.length ; x++) {
      if (ashea![x].governorate == governateSelection &&
          ashea![x].region == regionSelection) {
        catAshea = ashea![x].category;

      }

    }

    emit(GetFilterCatState());
    print('gggggggggggg $catAshea');
    catAshea != '' ?
    allofFilter.add(catAshea) : '';

    for(int x = 0 ; x < tebeya!.length ; x++) {
      if (tebeya![x].governorate == governateSelection &&
          tebeya![x].region == regionSelection) {
        catTebeya = tebeya![x].category;

      }

    }

    emit(GetFilterCatState());
    print('gggggggggggg $catTebeya');
    catTebeya != '' ?
    allofFilter.add(catTebeya) : '';

    for(int x = 0 ; x < gym!.length ; x++) {
      if (gym![x].governorate == governateSelection &&
          gym![x].region == regionSelection) {
        catGym = gym![x].category;

      }

    }
    emit(GetFilterCatState());
    print('gggggggggggg $catGym');
    catGym != '' ?
    allofFilter.add(catGym) : '';

    for(int x = 0 ; x < beauty!.length ; x++) {
      if (beauty![x].governorate == governateSelection &&
          beauty![x].region == regionSelection) {
        catBeauty = beauty![x].category;

      }

    }
    emit(GetFilterCatState());
    print('gggggggggggg $catBeauty');
    catBeauty != '' ?
    allofFilter.add(catBeauty) : '';

    for(int x = 0 ; x < hadanat!.length ; x++) {
      if (hadanat![x].governorate == governateSelection &&
          hadanat![x].region == regionSelection) {
        catHadanat = hadanat![x].category;

      }

    }

    emit(GetFilterCatState());
    print('gggggggggggg $catHadanat');
    catHadanat != '' ?
    allofFilter.add(catHadanat) : '';

    for(int x = 0 ; x < betareya!.length ; x++) {
      if (betareya![x].governorate == governateSelection &&
          betareya![x].region == regionSelection) {
        catBetareya = betareya![x].category;
      }}
    emit(GetFilterCatState());
    print('gggggggggggg $catBetareya');
    catBetareya != '' ?
    allofFilter.add(catBetareya) : '';
  }
  List<String?> matchAll = [] ;
  List<int?> idMatchAll = [] ;
  getGridViewByRegionAndGov(
      {required String? governateSelection ,
        required String? regionSelection ,
        required String? categoery}) async
  {
for(int x = 0 ; x < hospital!.length ; x++) {
  if (hospital![x].governorate.toString() == governateSelection &&
      hospital![x].region.toString() == regionSelection &&
      hospital![x].category.toString() == categoery ) {


    matchAll.add(hospital![x].serviceProvider);

    idMatchAll.add(x);

  }
  }

emit(GetGridViewState());



for(int x = 0 ; x < clinica!.length ; x++) {
  if (clinica![x].governorate == governateSelection &&
      clinica![x].region == regionSelection&&
      clinica![x].category == categoery ) {

    matchAll.add(clinica![x].serviceProvider);
    idMatchAll.add(x);
  }


}
emit(GetGridViewState());


for(int x = 0 ; x < basareyat!.length ; x++) {
  if (basareyat![x].governorate == governateSelection &&
      basareyat![x].region == regionSelection&&
      basareyat![x].category == categoery ) {

    matchAll.add(basareyat![x].serviceProvider);
    idMatchAll.add(x);
  }

}

emit(GetGridViewState());


for(int x = 0 ; x < pharma!.length ; x++) {
  if (pharma![x].governorate == governateSelection &&
      pharma![x].region == regionSelection&&
      pharma![x].category == categoery ) {

    matchAll.add(pharma![x].serviceProvider);
    idMatchAll.add(x);

  }

}
emit(GetGridViewState());

for(int x = 0 ; x < lab1!.length ; x++) {
  if (lab1![x].governorate == governateSelection &&
      lab1![x].region == regionSelection &&
      lab1![x].category == categoery ) {

    matchAll.add(lab1![x].serviceProvider);
    idMatchAll.add(x);

  }

}
emit(GetGridViewState());

for(int x = 0 ; x < marakez!.length ; x++) {
  if (marakez![x].governorate == governateSelection &&
      marakez![x].region == regionSelection &&
      marakez![x].category == categoery ) {

    matchAll.add(marakez![x].serviceProvider);
    idMatchAll.add(x);

  }

}

emit(GetGridViewState());

for(int x = 0 ; x < ashea!.length ; x++) {
  if (ashea![x].governorate == governateSelection &&
      ashea![x].region == regionSelection&&
      ashea![x].category == categoery ) {

    matchAll.add(ashea![x].serviceProvider);
    idMatchAll.add(x);
  }

}

emit(GetGridViewState());

for(int x = 0 ; x < tebeya!.length ; x++) {
  if (tebeya![x].governorate == governateSelection &&
      tebeya![x].region == regionSelection&&
      tebeya![x].category == categoery ) {

    matchAll.add(tebeya![x].serviceProvider);
    idMatchAll.add(x);

  }

}

emit(GetFilterCatState());


for(int x = 0 ; x < gym!.length ; x++) {
  if (gym![x].governorate == governateSelection &&
      gym![x].region == regionSelection &&
      gym![x].category == categoery ) {

    matchAll.add(gym![x].serviceProvider);
    idMatchAll.add(x);
  }

}
emit(GetGridViewState());

for(int x = 0 ; x < beauty!.length ; x++) {
  if (beauty![x].governorate == governateSelection &&
      beauty![x].region == regionSelection &&
      beauty![x].category == categoery ) {

    matchAll.add(beauty![x].serviceProvider);
    idMatchAll.add(x);
  }

}
emit(GetGridViewState());

for(int x = 0 ; x < hadanat!.length ; x++) {
  if (hadanat![x].governorate == governateSelection &&
      hadanat![x].region == regionSelection &&
      hadanat![x].category == categoery ) {

    matchAll.add(hadanat![x].serviceProvider);
    idMatchAll.add(x);
  }

}

emit(GetGridViewState());

for(int x = 0 ; x < betareya!.length ; x++) {
  if (betareya![x].governorate == governateSelection &&
      betareya![x].region == regionSelection&&
      betareya![x].category == categoery ) {

    matchAll.add(betareya![x].serviceProvider);
    idMatchAll.add(x);
  }}
emit(GetGridViewState());

  }

  void clearData() {
    allofFilter = [];
    matchAll = [];
    idMatchAll =[];
emit(DeleteFilterState());
  }

}

