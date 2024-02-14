import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/Services/services_logic/cubit.dart';

import '../../../../generated/l10n.dart';
import '../../../logic/cubit/cubit.dart';
import '../../../logic/cubit/states.dart';

class OurCustomer extends StatelessWidget {
  const OurCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SafeArea(child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarDefaultTheme(context: context,

            title: S.of(context).customers,
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w ),
            child: Column(

              children: [
                Text(
                  ''
                  ,style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: mainLineColor,
                ),

                ),
              ],
            ),
          ),
        )));
  }
}
