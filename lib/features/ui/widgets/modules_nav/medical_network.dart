import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/l10n.dart';

import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/features/categories/categories_logic/cubit.dart';
import 'package:n_m_c/features/categories/categories_logic/state.dart';
import 'package:n_m_c/features/logic/cubit/cubit.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/ui/widgets/gridItemHospital/hospital_grid.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';

import '../../../../core/constant/const/const.dart';
import '../../test.dart';

class MedicalNetwork extends StatefulWidget {
  const MedicalNetwork({Key? key}) : super(key: key);

  @override
  State<MedicalNetwork> createState() => _MedicalNetworkState();
}

class _MedicalNetworkState extends State<MedicalNetwork> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarDefaultTheme(
            context: context,
            title: S.of(context).HeaderListN,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    onTap: () async
                    {
                      navigateTo(context, Test());

                    },
                    child: Container(
                      decoration: BoxDecoration(color: fillRectangular,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      height: 45.h,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          SvgPicture.asset('assets/images/lets-icons_filter.svg'),
                          SizedBox(width: 5.w,),
                          Text(S.of(context).filter_text,style: GoogleFonts.tajawal(fontSize: 16.sp,
                              color: mainLineColor),),
                        ], ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  BlocConsumer<CategoriesCubit, CategoriesStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is GetLoadingCategoriesState) {
                           Center(child:  Lottie.asset('assets/animation/Animation - 1703883437162.json'));
                        }
                        if (state is GetSuccessCategoriesState) {
                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 0.0),

                            crossAxisCount: 2,
                            //number of them

                            children: List.generate(
                              CategoriesCubit.get(context).data!.length,
                              (index) {
                                return InkWell(
                                    onTap: () {
                                      navigateTo(
                                          context,  HospitalGridMain(title : CategoriesCubit.get(context).data![index].category));
                                    },
                                    child: HomeScreen.builderGridView(
                                        CategoriesCubit.get(context)
                                            .data![index]));
                              },
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
