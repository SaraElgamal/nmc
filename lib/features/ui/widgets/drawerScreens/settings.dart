import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/core/data_base/cache_helper/cache_helper.dart';
import 'package:n_m_c/features/auth/Register/register_presentation/sign_up/signup.dart';
import 'package:n_m_c/features/auth/login/login_logic/cubit.dart';
import 'package:n_m_c/features/payment/way_to_pay.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../logic/cubit/cubit.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  static var formKeyEdit = GlobalKey<FormState>();

var editNameController = TextEditingController();
var editLastController = TextEditingController();
var editPhoneController = TextEditingController();
var editEmailController = TextEditingController();

var  getFirstNameRegister = CacheHelper.getData(key: 'nameLogIn');
var  getlastNameRegister = CacheHelper.getData(key: 'LstnameLogIn');
var  getPhoneRegister = CacheHelper.getData(key: 'phoneLogin');
var  getEmailRegister = CacheHelper.getData(key: 'emailLogin');

  @override
  Widget build(BuildContext context) {
    editNameController.text = getFirstNameRegister;
    editLastController.text = getlastNameRegister;
    editPhoneController.text = getPhoneRegister;
    editEmailController.text = getEmailRegister;

    return SafeArea(

        child: Form(
        key: Settings.formKeyEdit,
        child: Scaffold(

        backgroundColor: Colors.white,
        appBar: appBarDefaultTheme(context: context,
        title: S.of(context).Setting,

    ),
    body: Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start ,
    children: [
SizedBox(height: 24.h,),
      defaultTextFormFeild(
        context,
controller: editNameController ,
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        label: S.of(context).fName,
         hint: getFirstNameRegister,
        keyboardType: TextInputType.name,
        suffix: Container(),

      ),
      SizedBox(height: 24.h),
      defaultTextFormFeild(

        context,
controller: editLastController,
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        label: S.of(context).lName,
        // hint: 'الاسم الثاني',
        keyboardType: TextInputType.name,
        suffix: Container(),

      ),
      SizedBox(height: 24.h),
      defaultTextFormFeild(
        context,
controller: editPhoneController,
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        enabled: false,
        label: S.of(context).mobile_number,
        // hint: 'رقم التيلفون',
        keyboardType: TextInputType.phone,
        suffix: Container(),
      ),
      SizedBox(height: 24.h),
      defaultTextFormFeild(
        context,
        suffix: Container(),
        controller: editEmailController,
        enabled: false,
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        label: S.of(context).email,
        // hint: 'البريد الالكتروني',
        keyboardType: TextInputType.emailAddress,

      ),



      SizedBox(height: 80.h),
      defaultButton(context: context,
          text: S.of(context).Edit,
          toPage: () {

            if(Settings.formKeyEdit.currentState!.validate()) {
              // navigateTo(context,
              //     const  HomePage()) ;
            LoginCubit.get(context).EditProfileUser(
               firstName: editNameController.text,
               lastName: editLastController.text,
             phone: editPhoneController.text,
               email: editEmailController.text,
             );

            }
          }),
],
    ),),),),),);

  }}