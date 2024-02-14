import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/Services/services_logic/cubit.dart';
import 'package:n_m_c/features/Services/services_logic/state.dart';

import '../../../../generated/l10n.dart';

class WhoWeAre extends StatefulWidget {
  const WhoWeAre({Key? key}) : super(key: key);

  @override
  State<WhoWeAre> createState() => _WhoWeAreState();
}

class _WhoWeAreState extends State<WhoWeAre> {
  @override
  void initState() {
    ServicesCubit.get(context).getDefinition();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(context: context,
      title: S.of(context).HeaderListA,

      ),
      body: BlocConsumer<ServicesCubit,ServicesStates>(
        listener: (context, state) {

        },
         builder: (context, state) {
          if(state is GetSuccessDefinitionState) {
           return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      ServicesCubit
                          .get(context)
                          .define![0].image_url.toString(), height: 371.h,
                      width: 358.w,),
                    SizedBox(height: 47.h,),
                    Text(S.of(context).HeaderListA, style: GoogleFonts.tajawal(

                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    SizedBox(height: 24.h,),
                    Text(ServicesCubit
                        .get(context)
                        .define![0].content.toString(),
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: mainLineColor,
                      ),),
                  ],
                ),
              ),
            );
          } else {
            return Lottie.asset('assets/animation/Animation - 1703883437162.json');
          }
         }
      ),
    );
  }
}
