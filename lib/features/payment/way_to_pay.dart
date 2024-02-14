import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/core/data_base/cache_helper/cache_helper.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/cubit.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/state.dart';
import 'package:n_m_c/features/payment/payment_logic/cubit.dart';
import 'package:n_m_c/features/payment/payment_logic/state.dart';
import 'package:n_m_c/features/payment/payment_model/payment_model.dart';

import '../../generated/l10n.dart';
import '../logic/cubit/cubit.dart';
import '../ui/widgets/modules_nav/registration.dart';
import 'CodePage.dart';

class WayToPay extends StatefulWidget {
  const WayToPay({Key? key}) : super(key: key);

  @override
  State<WayToPay> createState() => _WayToPayState();
}

var getFullName = CacheHelper.getData(key: 'fullName');
var getEmail = CacheHelper.getData(key: 'email');
var getPhone = CacheHelper.getData(key: 'phoneNumber');
var getAddress = CacheHelper.getData(key: 'address');







List<String> nameParts = fullName.text.split(' ');

String firstName = nameParts[0];
String lastName = nameParts.length > 1 ? nameParts[1] : '';

class _WayToPayState extends State<WayToPay> {


  var getPayId ;

// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PaymentCubit.get(context).getPaymentNetwork();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
  appBar: appBarDefaultTheme(context: context,  title: '',actions: [Container()]),
  body: Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.w),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
SizedBox(height: 16.h,),
       Text(

         S.of(context).pay_way, style: GoogleFonts.tajawal(
           fontSize: 24.sp,
           color: Colors.black,
           fontWeight: FontWeight.bold,

       ), ),

            SizedBox(height: 16.h,),
            BlocConsumer<PaymentCubit,PaymentStates>(

              listener: (context, state) {

              },
              builder: (context, state)
              {
                if(state is GetSuccessPaymentStates) {
                      return    GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: PaymentCubit.get(context).data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return
                                  payBuild(
                                      PaymentCubit.get(context).data![index],index);

                            },
                          );  }
                else {
                        return  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Center(child:Lottie.asset('assets/animation/Animation - 1703883437162.json'),
                ),

                          ],
                        );
                      }

                    }),

            SizedBox(height: 16.h,),
BlocConsumer<CardCubit,CardStates>(
  listener: (context, state) {
if(state is PostSuccessExcutePayCardState) {
  navigateFinish(context,  CodePage());
  print('7akeka $getPayId');
}
  },
 builder: (context, state) =>   defaultButton(context: context, text: S.of(context).details, toPage: () {

     setState(() {
       CardCubit.get(context).postExcutePayment(

           first_name: firstName,

           last_name: lastName,

           email: email.text,

           phone: phone_number.text,

           address:  address.text,

           card_type: cubit.isSelected ? 'للاسره' : 'للفرد',

           price: cubit.isSelected ? 500 : 200,

           payment_method_id: getPayId,

           cartTotal: cubit.isSelected ? 500 : 200);
     });
     print('fffffffff$getPayId');

     // Navigate to CodePage and remove it from the stack
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => CodePage()),
     );
   }

),
),
     ], ),
    ),
  ),
      ),
    );
  }
  int selectedPaymentIndex = -1;
int? rightPay  ;
  Widget payBuild(DataPayment pay, int index) => GestureDetector(
    onTap: () {
      setState(() {
        selectedPaymentIndex = index;
        rightPay =  PaymentCubit.get(context).paymentIdCatch[selectedPaymentIndex];
        print(rightPay);
        print('rightPayaaaaaaaaaa');
        CacheHelper.saveData(key: 'RightIdPayment', value: rightPay);
        getPayId = CacheHelper.getData(key: 'RightIdPayment');
      });
    },
    child: Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: 160.h,
          width: 171.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(4, 4), // Shadow position
              ),
            ],
            color: selectedPaymentIndex == index
                ? primaryColor
                : fillRectangular,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          top: 12.h,
          child: Container(
            height: 100.h,
            width: 130.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  pay.logo.toString(),
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(

          bottom: 48.h,
          child: Text(
            pay.name_ar.toString().length > 20 ? pay.name_ar.toString().substring(0 , 20) : pay.name_ar.toString() ,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: selectedPaymentIndex == index
                  ? Colors.white
                  : mainLineColor,
            ),
          ),
        ),
        Positioned(
          bottom: 26.h,
          child: Text(
            pay.name_en.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: selectedPaymentIndex == index
                  ? Colors.white
                  : mainLineColor,
            ),
          ),
        ),
      ],
    ),
  );

}
