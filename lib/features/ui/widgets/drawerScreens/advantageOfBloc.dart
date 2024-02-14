import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/Services/services_logic/cubit.dart';
import 'package:n_m_c/features/Services/services_logic/state.dart';

import '../../../../generated/l10n.dart';

class AdavantageOfCard extends StatelessWidget {
  const AdavantageOfCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(context: context,
        title: S.of(context).cart,

      ),
      body: BlocConsumer<ServicesCubit,ServicesStates>(
        listener: (context, state) {

        },
        builder: (context, state) =>  Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Image.network(
                  ServicesCubit
                      .get(context)
                      .CardFImage![0].image_url.toString(), height: 371.h,
                  width: 358.w,),


                SizedBox(height: 47.h,),
                Text(S.of(context).cart, style: GoogleFonts.tajawal(

                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color:  Colors.black,
                ),),
                SizedBox(height: 16.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    ServicesCubit.get(context).contentFCard![0].content.toString(),

                    style: GoogleFonts.tajawal(

                    fontSize: 16.sp,
                    color:  mainLineColor,
                  ),),
                ),
                SizedBox(height: 16.h,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
