import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/features/auth/Register/register_logic/cubit.dart';
import 'package:n_m_c/features/auth/Register/register_logic/state.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/ui/widgets/homePge.dart';


import '../../../../../core/constant/components/components.dart';
import '../../../../../core/constant/const/const.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../logic/cubit/cubit.dart';
import '../../../../ui/widgets/modules_nav/home_screen.dart';
import '../../../login/login_presentation/login/login.dart';

var firstNameRegister = TextEditingController();
var lastNameRegister = TextEditingController();
var phoneNumberRegister = TextEditingController();
var emailRegister = TextEditingController();
var passwordRegister = TextEditingController();

class SignUpPage extends StatefulWidget {
   SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
var formKeyRegister = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Form(
          key: formKeyRegister,
          child: Scaffold(
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: BlocConsumer<RegisterCubit,RegisterStates>(

        listener: (context, RegisterStates state) {
          if (state is PostSuccessRegisterState) {
            showToast(text: state.message, state: ToastStates.success);
            navigateTo(context, const HomePage());
          }
          if (state is PostErrorRegisterState) {
            showToast(text: state.messageErr, state: ToastStates.error);
          }
        },
                builder: (context, state) =>
           SingleChildScrollView(
                  child: BlocConsumer<AppCubit,AppStates>(
                    listener: (context, state)
                    {

                },
                    builder:(context, state) =>  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 113.h),
                        /// /// ////////////////////////////////
                        Text(S.of(context).create_an_account,style: GoogleFonts.tajawal(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
                        /// ///////////////////////////
                        SizedBox(height: 64.h),
                        defaultTextFormFeild(
                          context,
controller: firstNameRegister,
                          validate:  (value)
                          {
                            if (value == null || value == '') {
                              return S.of(context).validation;
                            }
                            if (value.length < 2) {
                              return S.of(context).condition_name;
                            }
                          },
                          label: S.of(context).fName,
                          // hint: 'الاسم الاول',
                          keyboardType: TextInputType.name,
suffix: Container(),

                        ),
                        SizedBox(height: 24.h),
                        defaultTextFormFeild(
                          context,
controller: lastNameRegister,
                          validate:  (value)
                          {
                            if (value == null || value == '') {
                              return S.of(context).validation;
                            }
                            if (value.length < 2) {
                              return S.of(context).condition_name;
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
controller: phoneNumberRegister,
                          validate:  (value)
                          {
                            if (value == null || value == '') {
                              return S.of(context).validation;
                            }
                            if (value.length < 11 ) {
                              return S.of(context).condition_phone;
                            }
                          },
                          label: S.of(context).mobile_number,
                          // hint: 'رقم التيلفون',
                          keyboardType: TextInputType.phone,
suffix: Container(),
                        ),
                        SizedBox(height: 24.h),
                        defaultTextFormFeild(
                          context,
controller: emailRegister,
suffix: Container(),
                          validate:  (value)
                          {
                            if (value == null || value == '') {
                              return S.of(context).validation;
                            }
                            if (!value.contains('@')) {
                              return S.of(context).condition_email;
                            }
                          },
                          label: S.of(context).email,
                          // hint: 'البريد الالكتروني',
                          keyboardType: TextInputType.emailAddress,

                        ),
                        SizedBox(height: 24.h),

                        defaultTextFormFeild(

                          context,
                          onSubmit: (_){},
                          secure: AppCubit.get(context).isPasswordSign,
                          suffix: AppCubit.get(context).suffixSign,
controller: passwordRegister,
                          onpressed: (){
                            AppCubit.get(context).suffixChangeSign();

                          },
                          keyboardType: TextInputType.text,

                          validate: (value)
                          {
                            if (value == null || value == '') {
                              return S.of(context).validation;
                            }
                            if (value.length < 4) {
                              return S.of(context).condition_pass ;
                            }
                          },
                          // hint: 'كلمة السر',
                          label:S.of(context).pass,
                        ),

                        SizedBox(height: 80.h),
                        defaultButton(context: context,
                          text: S.of(context).create_an_account,
                          toPage: () {


                            if(formKeyRegister.currentState!.validate()) {
                              RegisterCubit.get(context).postNewUser(
                                  firstName: firstNameRegister.text,
                                  lastName: lastNameRegister.text,
                                  email: emailRegister.text,
                                  phone: phoneNumberRegister.text,
                                password: passwordRegister.text,
                              );

                            }
                          }),

                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: S.of(context).have_account,
                                    style: GoogleFonts.tajawal(
                                      color: const Color(0xff606F7B),
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

                                  navigateTo(context,  LogInPage() );

                                },
                                child: Text(S.of(context).buttonEnt,
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
