import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/Services/services_logic/state.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';

import '../../../../../generated/l10n.dart';
import '../../../../Services/services_logic/cubit.dart';

class CallUs extends StatefulWidget {
  CallUs({Key? key}) : super(key: key);

  @override
  State<CallUs> createState() => _CallUsState();
}

class _CallUsState extends State<CallUs>
    with TickerProviderStateMixin{
  bool checkAnimated = false ;
  bool checkAnimatedMessage = false ;
  bool checkAnimatedLocation = false ;
  var formKey = GlobalKey<FormState>();

  var name = TextEditingController();

  var email = TextEditingController();

  var phone = TextEditingController();

  var message = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _animationControllerMessage;
  late Animation<double> _animationMessage;
  late AnimationController _animationControllerLocation;
  late Animation<double> _animationLocation;

@override
  void initState() {
    // TODO: implement initState
  _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  _animationControllerMessage = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  _animationControllerLocation = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  _animation = Tween<double>(begin: 300.0, end: 1.0).animate(_animationController)
    ..addStatusListener((state) {


    })..addListener(() {
      setState(() {

      });
    });
  _animationMessage = Tween<double>(begin: 300.0, end: 1.0).animate(_animationControllerMessage)
    ..addStatusListener((state) {


    })..addListener(() {
      setState(() {

      });
    });
  _animationLocation = Tween<double>(begin: 400.0, end: 1.0).animate(_animationControllerLocation)
    ..addStatusListener((state) {


    })..addListener(() {
      setState(() {

      });
    });
  ServicesCubit.get(context).getFooterNetwork();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerMessage.dispose();
    _animationControllerLocation.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  var call = ServicesCubit.get(context);
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarDefaultTheme(
            context: context,
            title: S.of(context).HeaderListC,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: SingleChildScrollView(
              child: BlocBuilder<ServicesCubit,ServicesStates>(
                builder:  (context, state) =>
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    defaultTextFormFeild(
                      context,
                      controller: name,
                      validate: (value) {
                        if (value == null || value == '') {
                          return S.of(context).validation;
                        }
                      },
                      label: S.of(context).FullName,
                      // hint: 'الاسم الاول',
                      keyboardType: TextInputType.name,
                      suffix: Container(),
                    ),
                    SizedBox(height: 24.h),
                    defaultTextFormFeild(
                      context,

                      validate: (value) {
                        if (value == null || value == '') {
                          return S.of(context).validation;
                        }
                      },
                      controller: phone,
                      label: S.of(context).mobile_number,
                      // hint: 'رقم التيلفون',
                      keyboardType: TextInputType.phone,
                      suffix: Container(),
                    ),
                    SizedBox(height: 24.h),
                    defaultTextFormFeild(
                      context,
                      suffix: Container(),
                      controller: email,
                      validate: (value) {
                        if (value == null || value == '') {
                          return S.of(context).validation;
                        }
                      },
                      label: S.of(context).email,
                      // hint: 'البريد الالكتروني',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(

                      keyboardType: TextInputType.multiline,
                      minLines: 4, // Set this
                      maxLines: 6,
                      controller: message,
                      decoration: InputDecoration(
                        labelText: S.of(context).message_details,

                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
                        border: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        labelStyle: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: const Color(0xff606F7B),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    BlocConsumer<ServicesCubit, ServicesStates>(
                      listener: (context, state) {},
                      builder: (context, state) => defaultButton(
                          context: context,
                          text: S.of(context).send,
                          toPage: () {
                            if (formKey.currentState!.validate()) {
                              ServicesCubit.get(context).getMessageCallUsNetwork(
                                  firstName: name.text,
                                  email: email.text,
                                  phone: phone.text,
                                  detail: message.text);
                            }
                          }),
                    ),
                    SizedBox(height: 90.h),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (BuildContext context, Widget? child) =>  Row(
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              setState(() {
                                checkAnimated = ! checkAnimated;
                                checkAnimated ? _animationController.forward() : _animationController.reverse();
                              });
                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: SvgPicture.asset(
                                fit: BoxFit.none,
                                'assets/images/call.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w,),
                          Flexible(child: Transform.translate(

                              offset: Offset(_animation.value,0.0),

                              child: Text('${call.footer![0].phoneNumber.toString()} / ${call.footer![0].landline.toString()}',style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),))),

                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    AnimatedBuilder(
                      animation: _animationControllerMessage,
                      builder: (BuildContext context, Widget? child) =>  Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                checkAnimatedMessage = ! checkAnimatedMessage;
                                checkAnimatedMessage ? _animationControllerMessage.forward() : _animationControllerMessage.reverse();
                              });

                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: SvgPicture.asset(
                                fit: BoxFit.none,
                                'assets/images/message.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w,),
                          Flexible(child: Transform.translate(
                              offset: Offset(_animationMessage.value,0.0),
                              child: Text(call.footer![0].email.toString(),style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),))),

                        ],
                      ),),
                    SizedBox(height: 15.h),
                    AnimatedBuilder(
                      animation: _animationControllerLocation,
                      builder: (BuildContext context, Widget? child) =>  Row(
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                              checkAnimatedLocation = ! checkAnimatedLocation;
                              checkAnimatedLocation ? _animationControllerLocation.forward() : _animationControllerLocation.reverse();
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SvgPicture.asset(
                              fit: BoxFit.none,
                              'assets/images/location.svg',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w,),
                        Flexible(child:  Transform.translate(
                            offset: Offset(_animationLocation.value,0.0),


                            child: Text(call.footer![0].location.toString(),style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),))),

                      ],
                    ),),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );


  }

}
