import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/features/categories/categories_logic/cubit.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/ui/widgets/gridItemHospital/hospital_details.dart';
import 'package:n_m_c/features/ui/widgets/gridItemHospital/hospital_grid.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';
import 'package:n_m_c/features/ui/widgets/test_entered.dart';

import '../../../../core/constant/const/const.dart';
import '../../../../generated/l10n.dart';
import '../../../categories/types_of_cat/cat_items/all_cat_item_model/all_cat_item_model.dart';
import '../../../categories/types_of_cat/cat_items/all_cat_items_logic/cubit.dart';
import '../../../categories/types_of_cat/cat_items/all_cat_items_logic/state.dart';
import '../../test.dart';

class HospitalGridMain extends StatefulWidget {
  final String? title ;
   HospitalGridMain({required this.title});
  @override
  State<HospitalGridMain> createState() => _HospitalGridMainState();

  static Widget builderGridViewDataAll(DataAllCatDetails cli) => BlocConsumer<ClinicCubit,ClinicStates>(
    listener: (context, state) {

    },
    builder: (context, state) {

        return Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  height: 160.h,
                  width: 171.w,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  child: Container(
                    height: 100.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(cli.image_url.toString()),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      cli.serviceProvider.toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        );
      }


  );

}

class _HospitalGridMainState extends State<HospitalGridMain> {
 getDetails(String? title ,BuildContext context)  {

    switch (title) {
      case 'مستشفيات':
        return  List.generate(
          ClinicCubit.get(context).hospital!.length,
              (index) {
            return InkWell(
                onTap: () {
                  navigateTo(context,  HospitalDetails(title: title,index: index,));
                },
                child: HospitalGridMain.builderGridViewDataAll(
                    ClinicCubit.get(context).hospital![index]));
          },
        );
      case 'عيادات':
        return  List.generate(
          ClinicCubit.get(context).clinica!.length,
              (index) {
            return InkWell(
                onTap: () {
                  navigateTo(context,  HospitalDetails(title: title,index: index,));
                },
                child: HospitalGridMain.builderGridViewDataAll(
                    ClinicCubit.get(context).clinica![index]));
          },
        );
      case 'بصريات':
        return  List.generate(
          ClinicCubit.get(context).basareyat!.length,
              (index) {
            return InkWell(
                onTap: () {
                  navigateTo(context,  HospitalDetails(title: title,index: index,));
                },
                child: HospitalGridMain.builderGridViewDataAll(
                    ClinicCubit.get(context).basareyat![index]));
          },
        );
      case 'صيدليات':
        return  List.generate(
          ClinicCubit.get(context).pharma!.length,
              (index) {
            return InkWell(
                onTap: () {
                  navigateTo(context,  HospitalDetails(title: title,index: index,));
                },
                child: HospitalGridMain.builderGridViewDataAll(
                    ClinicCubit.get(context).pharma![index]));
          },
        );
        case 'مراكز تخصصية':
          return  List.generate(
            ClinicCubit.get(context).marakez!.length,
                (index) {
              return InkWell(
                  onTap: () {
                    navigateTo(context,  HospitalDetails(title: title,index: index,));
                  },
                  child: HospitalGridMain.builderGridViewDataAll(
                      ClinicCubit.get(context).marakez![index]));
            },
          );
          case 'معامل تحاليل':
      return  List.generate(
        ClinicCubit.get(context).lab1!.length,
            (index) {
          return InkWell(
              onTap: () {
                navigateTo(context,  HospitalDetails(title: title,index: index,));
              },
              child: HospitalGridMain.builderGridViewDataAll(
                  ClinicCubit.get(context).lab1![index]));
        },
      );
      case 'مراكز أشعه':
        return  List.generate(
          ClinicCubit.get(context).ashea!.length,
              (index) {
            return InkWell(
                onTap: () {
                  navigateTo(context,  HospitalDetails(title: title,index: index,));
                },
                child: HospitalGridMain.builderGridViewDataAll(
                    ClinicCubit.get(context).ashea![index]));
          },
        );
        case 'مراكز طبيه':
          return  List.generate(
            ClinicCubit.get(context).tebeya!.length,
                (index) {
              return InkWell(
                  onTap: () {
                    navigateTo(context,  HospitalDetails(title: title,index: index,));
                  },
                  child: HospitalGridMain.builderGridViewDataAll(
                      ClinicCubit.get(context).tebeya![index]));
            },
          );
          case 'جيم - صالات رياضية':
            return  List.generate(
              ClinicCubit.get(context).gym!.length,
                  (index) {
                return InkWell(
                    onTap: () {
                      navigateTo(context,  HospitalDetails(title: title,index: index,));
                    },
                    child: HospitalGridMain.builderGridViewDataAll(
                        ClinicCubit.get(context).gym![index]));
              },
            );
            case 'بيوتي سنتر':
              return  List.generate(
                ClinicCubit.get(context).beauty!.length,
                    (index) {
                  return InkWell(
                      onTap: () {
                        navigateTo(context,  HospitalDetails(title: title,index: index,));
                      },
                      child: HospitalGridMain.builderGridViewDataAll(
                          ClinicCubit.get(context).beauty![index]));
                },
              );
              case 'حضانات تعليمية':
                return  List.generate(
                  ClinicCubit.get(context).hadanat!.length,
                      (index) {
                    return InkWell(
                        onTap: () {
                          navigateTo(context,  HospitalDetails(title: title,index: index,));
                        },
                        child: HospitalGridMain.builderGridViewDataAll(
                            ClinicCubit.get(context).hadanat![index]));
                  },
                );
                case 'عيادات بيطرية':
                  return  List.generate(
                    ClinicCubit.get(context).betareya!.length,
                        (index) {
                      return InkWell(
                          onTap: () {
                            navigateTo(context,  HospitalDetails(title: title,index: index,));
                          },
                          child: HospitalGridMain.builderGridViewDataAll(
                              ClinicCubit.get(context).betareya![index]));
                    },
                  );
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:
      Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarDefaultTheme(
          context: context,
          ///TODO TITLE
          title: widget.title,

        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                // searchTextField(
                //     context: context,
                //     search: (value) {},onTap: ()
                // {
                //   setState(() {
                //     isSearch = true;
                //   });
                // }
                //     , onTapOutside: (tap)
                // {
                //   setState(() {
                //     isSearch = false;
                //   });
                // }
                //     ,onSaved: (tap)
                // {
                //   setState(() {
                //     isSearch = false;
                //   });
                // }
                // ),


                InkWell(
                  onTap: () async
                  {
                    navigateTo(context, EnteredTest(title: widget.title));

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

                BlocBuilder<ClinicCubit,ClinicStates>(
                  builder: (context, state)
                  {
                    if (state is GetLoadingClinicState) {
                       return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/animation/Animation - 1703883437162.json'),
                          ],
                        );



                    }

else {
                  return
                  Column(
                  children: [
                   Center(child: Text(S.of(context).loading)),
                  GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 0.0),

                  crossAxisCount: 2,
                  //number of them

                  children: getDetails(widget.title, context),
                  ),
                  ],
                  );
                  } }




                ),


              ],
            ),
          ),
        ),
      ),
   );


  }
}
