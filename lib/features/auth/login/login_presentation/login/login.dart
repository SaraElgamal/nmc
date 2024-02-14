

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/data_base/cache_helper/cache_helper.dart';
import 'package:n_m_c/features/auth/login/login_logic/cubit.dart';
import 'package:n_m_c/features/auth/login/login_logic/state.dart';
import 'package:n_m_c/features/auth/login/login_model/login_model.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/ui/widgets/homePge.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';

import '../../../../../core/constant/components/components.dart';
import '../../../../../core/constant/const/const.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/Register/register_presentation/sign_up/signup.dart';
import '../../../../logic/cubit/cubit.dart';


class LogInPage extends StatefulWidget {
   LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
   var formKeyLogin = GlobalKey<FormState>();
   var phoneNumberLogin = TextEditingController();
   var passLogin = TextEditingController();

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberLogin.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return  SafeArea(
        child: Scaffold(
    body: Form(
      key: formKeyLogin,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context, LoginStates state) {
            if(state is PostSuccessLoginState){
              showToast(text: state.message, state: ToastStates.success);
             navigateTo(context, const  HomePage());
            }
            if(state is PostErrorLoginState)
            {
              showToast(text: state.messageErr, state: ToastStates.error);
            }
          },
          builder : (context,LoginStates state) => SingleChildScrollView(
            child: BlocConsumer<AppCubit,AppStates>(
              listener: (context, state) {

              },
              builder:(context, state) =>  Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 113.h),
                  /// /// ////////////////////////////////
                  Text(S.of(context).buttonEnt,style: GoogleFonts.tajawal(
                  fontSize: 24,

                    fontWeight: FontWeight.bold,
                  ),

                  ),
/// ///////////////////////////
                  SizedBox(height: 112.h),
                  defaultTextFormFeild(
                     context,
                    onSubmit: (_){},
      validate:  (value)
              {
              if (value == null || value == '') {
                          return S.of(context).validation;
                        }
                      },
                    controller: phoneNumberLogin,
                    label: S.of(context).mobile_number,
                 //   hint: 'رقم الموبايل',
                    keyboardType: TextInputType.phone,
suffix: Container(),
                  ),
                  SizedBox(height: 24.h),

                  defaultTextFormFeild(

                    context,
                    onSubmit: (_){},
                    secure: AppCubit.get(context).isPassword,
                    suffix: AppCubit.get(context).suffix,

                    onpressed: (){
                      AppCubit.get(context).suffixChange();

                    },
                    keyboardType: TextInputType.text,

                    validate: (value)
                    {
                      if (value == null || value == '') {
                          return S.of(context).validation;
                        }
                      },
                    // hint: 'كلمة السر',
                    label:S.of(context).pass,
                    controller: passLogin,
                  ),
                  SizedBox(height: 6.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                 const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
       cubit.isChecked
                      ?
                     InkWell(
                       onTap: () {
                       cubit.checkChange();
                       },
                       child: cubit.checkIcon,
                     ) :    InkWell(
                        onTap: ()
                        {
                          cubit.checkChange();
                        },
                       child: cubit.checkIcon,
                     ),
          Text(S.of(context).remember_me, style: GoogleFonts.tajawal(
                      fontSize: 14.sp,

                    ),)
                  ],),
                    ],
                  ),
                 SizedBox(height: 69.h),
                  defaultButton(
                      context: context,

                      text: S.of(context).buttonEnt,

                      toPage: () {
                        {
                          if(formKeyLogin.currentState!.validate()) {
                            LoginCubit.get(context).loginOneUser(
                                phone: phoneNumberLogin.text,
                                password: passLogin.text);
                          }  }
                      }),

                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: S.of(context).have_not_account,
                              style: GoogleFonts.tajawal(

                                fontSize: 16.0.sp,


                                // height: 1.3,
                              ),
                            ),


                          ],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(width: 2.w,),
                      TextButton(

                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0.0),
                        ),
                        onPressed: (){},
                        child: TextButton(
                          onPressed:()
                          {
                            navigateTo(context,  SignUpPage() );
                          },
                          child: Text(S.of(context).create_new_account,
                        style: GoogleFonts.tajawal(
                          color: primaryColor,
                          fontSize: 16.0.sp,

                          fontWeight: FontWeight.w400,
                        //  height: 1.3,
                          ), ),),),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    ),
    ));
  }
}
