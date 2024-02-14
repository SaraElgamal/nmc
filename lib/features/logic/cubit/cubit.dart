import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';

import '../../../core/Repository/repo.dart';
import '../../auth/Register/register_model/register_model.dart';
import '../../slider/repo/slider_repo.dart';
import '../../ui/widgets/modules_nav/home_screen.dart';
import '../../ui/widgets/modules_nav/medical_card.dart';
import '../../ui/widgets/modules_nav/medical_network.dart';
import '../../ui/widgets/modules_nav/registration.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(InitialState());


  static AppCubit get(context) => BlocProvider.of(context);

bool isArabicSelected = true;
  changeSelect(bool select)
  {
    isArabicSelected = select;
    emit(changeButtonState());
  }

  var suffix = SvgPicture.asset(
    'assets/images/eye-slash.svg',
  );
  bool isPassword = true;

  void suffixChange() {
    isPassword = !isPassword;
    suffix = isPassword ? SvgPicture.asset(
      'assets/images/eye-slash.svg',
    ) : SvgPicture.asset(
      'assets/images/eye.svg',
    );
    emit(changeSuffixIconState());
  }

  var checkIcon = SvgPicture.asset(
    'assets/images/checkbox-blank-outline.svg',
    color: primaryColor,

  );
  bool isChecked = false;

  void checkChange() {
    isChecked = !isChecked;
    checkIcon = isChecked ? SvgPicture.asset(
      'assets/images/checkbox-fill.svg',
      color: primaryColor,
      height: 24,
      width: 24,
    ) : SvgPicture.asset(
      'assets/images/checkbox-blank-outline.svg',
      color: primaryColor,
      height: 24,
      width: 24,
    );
    emit(ChangeCheckBoxIconState());
  }

  var suffixSign = SvgPicture.asset(
    'assets/images/eye-slash.svg',
  );
  bool isPasswordSign = true;

  void suffixChangeSign() {
    isPasswordSign = !isPasswordSign;
    suffixSign = isPasswordSign ? SvgPicture.asset(
      'assets/images/eye-slash.svg',
    ) : SvgPicture.asset(
      'assets/images/eye.svg',
    );
    emit(changeSuffixSignUpIconState());
  }


  bool createPassword = false;

  createSuccess(successValidator) {
    createPassword = successValidator;
    emit(CreatePasswordState());
  }

  int maxCount = 4;

   List<Widget> bottomBarPages = [
    const HomeScreen(),
    const MedicalNetwork(),
    const MedicalCard(),
    Registration(),
  ];
  ///bottom nav
  int currentIndex = 0;


  List <Widget> screens =
  [
    const HomeScreen(),
    const MedicalNetwork(),
    const MedicalCard(),
    Registration(),


  ];
/// ////////////////////////
  ///
  List <String> titles =
  [
    'الرئيسية',
    'الشبكة الطبية',
    'الكارت الطبي',
    'التقديم',

  ];

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());

  }
  bool isSelected = false;
   isSelect() {

    emit(FamilyChange());
  }
}

