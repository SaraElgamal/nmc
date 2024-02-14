
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/core/constant/end_points/end_point.dart';
import 'package:n_m_c/features/auth/Register/register_logic/state.dart';
import 'package:n_m_c/features/auth/login/login_logic/state.dart';

import '../../../../core/constant/const/const.dart';
import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../core/utils/toast.dart';
import '../../Register/register_model/register_model.dart';
import 'login_repo.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginRepository loginRepo;

  LoginCubit(this.loginRepo ) : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);
  Future<bool> result = InternetConnectionChecker().hasConnection;

  loginOneUser({

    required String? phone,
    required String password,
  }) async
  {
    await loginRepo.loginUser(Client(

      phoneNumber: phone,
      password: password,
    )  ).then((value) => {
      if(value.status == true)
        {
        CacheHelper.saveData(key: 'nameLogIn', value: value.client!.firstName),
        CacheHelper.saveData(key: 'LstnameLogIn', value: value.client!.LastName),
        CacheHelper.saveData(key: 'phoneLogin', value: value.client!.phoneNumber),
        CacheHelper.saveData(key: 'emailLogin', value: value.client!.email),

    emit(PostSuccessLoginState(message: value.msg.toString())),
                }
   else if (value.status == false)
        {
   emit(PostErrorLoginState(messageErr: value.msg.toString())),
                }
 }).catchError((error) async
    {
      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      } else {
        emit(PostErrorLoginState(messageErr: error.toString()));
        debugPrint('errrrrror ${error.toString()}');
      }
    });
  }


  EditProfileUser({

    required String? firstName,
    required String lastName,
    required String phone,
    required String email,

  }) async
  {
    await loginRepo.editProfile(Client(
firstName: firstName,
      LastName: lastName,
      phoneNumber: phone,
      email: email,
      authToken: authToken,
    )  ).then((value) => {

      if(value.status == true)
        {
showToast(text: 'تم التعديل بنجاح', state: ToastStates.success),
          emit(PostSuccessEditProfileState()),
        }
      else if (value.status == false)
        {
          showToast(text: 'عفوا حدث خطأ', state: ToastStates.error),

          emit(PostErrorEditProfileState()),
        }
    }).catchError((error) async
    {
      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      } else {
        emit(PostErrorEditProfileState());
        showToast(text: 'عفوا حدث خطأ', state: ToastStates.error);

      debugPrint('errrrrror ${error.toString()}');
      }
    });
  }
}