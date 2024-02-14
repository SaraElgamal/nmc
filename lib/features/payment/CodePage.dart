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
import 'package:n_m_c/features/ui/widgets/homePge.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/registration.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';



class CodePage extends StatefulWidget {
   CodePage({Key? key}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {

   Widget codeOrLink (BuildContext context) {

return BlocConsumer<CardCubit,CardStates>(
  builder: (context, state) {
    if(state is PostSuccessExcutePayCardState || CardCubit
        .get(context)
        .Link != null ||  CardCubit
        .get(context)
        .Link != '' || CardCubit
        .get(context)
        .Code != null ||  CardCubit
        .get(context)
        .Code != 0) {
      final Uri url = Uri.parse(CardCubit
          .get(context)
          .Link
          .toString(),);

      if (CardCubit
          .get(context)
          .Link == null || CardCubit
          .get(context)
          .Link == '') {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(S.of(context).pay_code, style: GoogleFonts.tajawal(fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),),

              BlocConsumer<CardCubit, CardStates>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    if (state is PostSuccessExcutePayCardState || CardCubit
                        .get(context)
                        .Link == null || CardCubit
                        .get(context)
                        .Link == '') {
                      return
                        Text(


                          CardCubit
                              .get(context)
                              .Code != null ? '${CardCubit
                              .get(context)
                              .Code}' : CardCubit
                              .get(context)
                              .CodeFawry
                              .toString(), style: GoogleFonts.tajawal(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),);
                    } else {
                      return Center(child: Lottie.asset(
                          'assets/animation/Animation - 1703883437162.json'));
                    }
                  }),

            ],
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(S.of(context).pay_link,
                style: GoogleFonts.tajawal(fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),),
              SizedBox(height: 20.h,),
              BlocBuilder<CardCubit, CardStates>(
                  builder: (context, state) {
                    if (state is PostSuccessExcutePayCardState || CardCubit
                        .get(context)
                        .Link != null || CardCubit
                        .get(context)
                        .Link != '') {
                      return InkWell(
                        onTap: () {
                          launchUrl(url);
                        },

                        child: Text(CardCubit
                            .get(context)
                            .Link
                            .toString(),


                          style: GoogleFonts.tajawal(
                              decoration: TextDecoration.underline,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),),

                      );
                    } else {
                      return Center(child: Lottie.asset(
                          'assets/animation/Animation - 1703883437162.json'));
                    }
                  }
              ),
            ],
          ),
        );
      }
    }
    else {
      return Center(child: Lottie.asset(
          'assets/animation/Animation - 1703883437162.json'));

    }
  },
  listener: (context, state) {

  },
);



   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(
          context: context,
      title: '',
      ),
     body: Padding(
       padding:  EdgeInsets.symmetric(horizontal: 16.w),
       child: BlocConsumer<CardCubit,CardStates>(
         listener: (context, state) {

         },
         builder: (context, state) => Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              codeOrLink(context),
             ///
              SizedBox(height: 50.h,),

              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),bottomLeft:Radius.circular(40) ,bottomRight: Radius.circular(40)),
                    ),

                  ),
                  Center(child: Lottie.asset('assets/animation/Animation - 1704050757819.json',height: 200.h,width: 200.w)),

                ],
              ),
              SizedBox(height: 15.h,),
              defaultButton(
                  context: context, text: S.of(context).back_to_home, toPage: (){
                setState(() {
                  CacheHelper.clearData('RightIdPayment');
                  clearTextControllers();
                   CardCubit
                       .get(context)
                       .Link = '';
                  CardCubit
                      .get(context)
                      .CodeFawry = '';
                  CardCubit
                      .get(context).Code = 0;
                });
                navigateFinish(context, const HomePage());

              }),

            ],
         ),
       ),
     ),
    );
  }
}
