import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/Services/services_logic/cubit.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../Services/services_logic/state.dart';
import '../../../definition/definition_model.dart';

class Deals extends StatelessWidget {
  const Deals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(context: context,
        title: S.of(context).contracts,

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [

              BlocConsumer<ServicesCubit,ServicesStates>(
                listener: (context, state) {

                },
                builder: (context, state) {
    if(state is GetLoadingEngagementsState) {

    return  Lottie.asset('assets/animation/Animation - 1703883437162.json');





    } else {

    return  GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        // childAspectRatio: 1/ 1.72,

        crossAxisCount: 2, //number of them
        children:
        List.generate(ServicesCubit.get(context).engage!.length,
                (index) => builderDeals(ServicesCubit.get(context).engage![index])),

      );
                  }
                }

              ),
            ],
          ),
        ),
      ),
    );
  }
  static Widget builderDeals(DataEngagement engagement) =>
      BlocBuilder<ServicesCubit,ServicesStates>(

    builder: (context, state) {


      return Image.network(engagement.image_url.toString(),);

    },
  );

}
