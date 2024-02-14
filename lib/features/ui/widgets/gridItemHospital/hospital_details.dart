import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/core/constant/const/transition.dart';
import 'package:n_m_c/features/ui/test.dart';
import 'package:n_m_c/features/ui/widgets/gridItemHospital/hospital_grid.dart';

import '../../../categories/types_of_cat/cat_items/all_cat_item_model/all_cat_item_model.dart';
import '../../../categories/types_of_cat/cat_items/all_cat_items_logic/cubit.dart';
import '../../../categories/types_of_cat/cat_items/all_cat_items_logic/state.dart';

var checkNull = false ;
class HospitalDetails extends StatelessWidget {
  final String? title ;
  final int index ;
  HospitalDetails({required this.title,required this.index});

  getWhichDetailed(String? title ,BuildContext context,int index) {

    switch (title) {
      case 'مستشفيات':
        return  detailsBuild(ClinicCubit.get(context).hospital![index]);


      case 'عيادات':
        return detailsBuild(ClinicCubit.get(context).clinica![index]);

      case 'بصريات':
        return detailsBuild(ClinicCubit.get(context).basareyat![index]);

      case 'صيدليات':
        return  detailsBuild(ClinicCubit.get(context).pharma![index]);

      case 'مراكز تخصصية':
        return  detailsBuild(ClinicCubit.get(context).marakez![index]);

      case 'معامل تحاليل':
        return detailsBuild(ClinicCubit.get(context).lab1![index]);

      case 'مراكز أشعه':
        return  detailsBuild(ClinicCubit.get(context).ashea![index]);

      case 'مراكز طبيه':
        return detailsBuild(ClinicCubit.get(context).tebeya![index]);


      case 'جيم - صالات رياضية':
        return  detailsBuild(ClinicCubit.get(context).gym![index]);


      case 'بيوتي سنتر':
        return  detailsBuild(ClinicCubit.get(context).beauty![index]);

      case 'حضانات تعليمية':
        return detailsBuild(ClinicCubit.get(context).hadanat![index]);

      case 'عيادات بيطرية':
        return  detailsBuild(ClinicCubit.get(context).betareya![index]);

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        body: BlocConsumer<ClinicCubit,ClinicStates>(
          listener: (context, state) {

          },
          builder:(context, state)
          {

            if (state is GetLoadingClinicState) {
              const Center(
                  child: CircularProgressIndicator());}


              return  SingleChildScrollView(

                    child: getWhichDetailed(title.toString(), context,index),
                    );





                }),
        ),

    );

  }

    Widget detailsBuild(DataAllCatDetails cli) => BlocBuilder<ClinicCubit,ClinicStates>(
      builder: (context, state) => Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                cli.image_url.toString(),
                width: double.infinity,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(SliderRight(page: HospitalGridMain(title: title,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset('assets/images/hosarrow.svg'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 300.h, bottom: 0.h, left: 20.w, right: 20.w),
                  child: Container(
                    height: 80.h,
                    width: 320.w,
                    decoration:const BoxDecoration(
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 16.w, top: 16.h,),
                              child: SvgPicture.asset('assets/images/ear.svg'),
                            ),
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.only(top: 16.h),
                                child: Text(
                                  cli.serviceProvider.toString().length > 31
                                      ? cli.serviceProvider.toString().substring(0 , 30)
                                      :
                                  cli.serviceProvider.toString(),
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w,),
                          child: Text(
                            cli.serviceProvider.toString().length > 31
                                ? cli.serviceProvider.toString().substring(31)
                                : '',
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 16.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 36.0.w,
              vertical: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/colorHome.svg'),
                    SizedBox(width: 5.w,),
                    Text(cli.governorate.toString(),
                      style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: mainLineColor,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/location.svg',color: mainLineColor,),
                    SizedBox(width: 5.w,),
                    Flexible(
                      child: Text(cli.address.toString(),style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: mainLineColor,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    const Icon(Icons.star_border_sharp,color: mainLineColor,),
                    SizedBox(width: 5.w,),
                    Flexible(
                      child: Text(cli.specialization.toString(),style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: mainLineColor,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [

                    SvgPicture.asset('assets/images/call.svg'),
                    SizedBox(width: 5.w,),
                    Text(

                      cli.phoneNumber.toString() == null ||   cli.phoneNumber.toString() == 'null' ?  ''
                          : cli.phoneNumber.toString(),style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: mainLineColor,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/call.svg'),
                    SizedBox(width: 5.w,),
                    Text(
                      cli.phoneNumbe2r.toString() == null || cli.phoneNumbe2r.toString() == 'null' ?  '' : cli.phoneNumbe2r.toString()  ,style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: mainLineColor,
                    ),

                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/id.svg'),
                    SizedBox(width: 5.w,),
                    Flexible(
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis ,
                        cli.discountPercentage.toString(),style: GoogleFonts.tajawal(
                        fontSize: 16.sp,

                        color: mainLineColor,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/CalendarCheck.svg'),
                    SizedBox(width: 5.w,),
                    Flexible(
                      child: Text(cli.appointments.toString(),style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: mainLineColor,
                      ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                // Row(
                //   children: [
                //     SvgPicture.asset('assets/images/colorHome.svg'),
                //     SizedBox(width: 5.w,),
                //     // Text('وصف',style: GoogleFonts.tajawal(
                //     //   fontSize: 16.sp,
                //     //   color: mainLineColor,
                //     // ),
                //     ),
                //   ],
                // ),

              ],
            ),
          ),
        ],
      ),
    );
}
