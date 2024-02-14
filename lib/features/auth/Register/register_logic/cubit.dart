
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/features/auth/Register/register_logic/register_repo.dart';
import 'package:n_m_c/features/auth/Register/register_logic/state.dart';
import 'package:n_m_c/features/slider/dataModel/slider_model.dart';
import 'package:n_m_c/features/slider/logic/state.dart';
import 'package:n_m_c/features/slider/repo/slider_repo.dart';

import '../../../../core/constant/const/const.dart';
import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../core/utils/toast.dart';
import '../register_model/register_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterRepository registerRepo;

  RegisterCubit(this.registerRepo) : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  Future<bool> result = InternetConnectionChecker().hasConnection;

  postNewUser({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? phone,
    required String password,
}) async
  {
    await registerRepo.createNewUser(
        Client(
     firstName: firstName,
LastName: lastName,
email: email,
phoneNumber: phone,
authToken: token,
password: password,
   )  ).then((value) => {
      if(value.status == true) {

        CacheHelper.saveData(key: 'nameLogIn', value: value.client!.firstName),
        CacheHelper.saveData(key: 'LstnameLogIn', value: value.client!.LastName),
        CacheHelper.saveData(key: 'phoneLogin', value: value.client!.phoneNumber),
        CacheHelper.saveData(key: 'emailLogin', value: value.client!.email),

        emit(PostSuccessRegisterState(message: value.msg.toString())),
      }
      else if (value.status == false)
        {
          emit(PostErrorRegisterState(
              messageErr: value.msg.toString())),
        }

   }).catchError((error)
     async
     {
       if ( await result == false) {
         showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

       } else {

         emit(PostErrorRegisterState(messageErr: 'هذه البيانات مسجل بها مسبقا'));
         debugPrint('errrrrror ${error.toString()}');
       }

   });
  }
}