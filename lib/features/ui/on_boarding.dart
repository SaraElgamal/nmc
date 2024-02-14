import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/features/ui/widgets/homePge.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constant/components/components.dart';
import '../../core/constant/const/const.dart';

class OnBoardingModel {
  final SvgPicture image;


  OnBoardingModel({
    required this.image,

  });

}
class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var PageControl = PageController();

  List <OnBoardingModel> onBoard = [
    OnBoardingModel(
      image: SvgPicture.asset('assets/images/undraw_medicine_b-1-ol.svg',),

    ),
    OnBoardingModel(
      image: SvgPicture.asset('assets/images/undraw_profile_data_re_v81r.svg',),

    ),
    OnBoardingModel(
      image: SvgPicture.asset('assets/images/undraw_doctors_p6aq.svg',),


    ),
  ];

  bool isLast = false;


  void submit(){
    navigateFinish(context, const HomePage());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [

              Stack(

                children: [
                  Container(
                    height: 809.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 530.h,
                    child: PageView.builder(itemBuilder: (context,index) =>


                              onBoard[index].image,




                      itemCount: onBoard.length,
                      controller: PageControl,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index){
                        if (index == onBoard.length-1) {
                          setState(() {
                            isLast = true;
                          });
                        }else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                    ),
                  ),

                  Positioned(

                    left: 0,
                    right: 0,
                    bottom: 0.h,
                    child: Stack(
                      children: [
                        Container(
                          height: 316.h,
                          width: double.infinity,
                          decoration:  BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                          ),
                        ),

                        Positioned(
                          top: 32.h,
                          left: 155.w,

                          child: SmoothPageIndicator(controller: PageControl,
                              effect: const ExpandingDotsEffect(
                                dotColor: Colors.grey,
                                activeDotColor: Colors.white ,
                                expansionFactor: 3,
                                spacing: 5.0,
                                dotHeight: 10.0,
                                dotWidth: 10.0,
                              ),
                              count: onBoard.length),
                        ),
                        Positioned(
                          top: 68.h,
                          right: 170.w,
                          left: 50.w,
                          child: Text('N.M.C',
                            style: GoogleFonts.tajawal(
                              fontSize: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 112.h,
                          right: 40.w,
                          left: 31.w,
                          child: Text('مرحبًا بكم في تطبيق nmc استمتع بخصومات كثيرة على المستشفيات والعيادات وجميع الخدمات الطبية ',

                            style: GoogleFonts.tajawal(
                              fontSize: 20.sp,
                              height: 1.3,
                              color:  mainLineColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 30.h,
                          left: 20.w,
                          right: 20.w,
                          child: defaultButton(

                            text: isLast ? 'ابدأ الان' : 'التالي',
                            context: context,
                            toPage: (){

                              if (isLast){
                                submit();
                              } else {
                                PageControl.nextPage(duration: const Duration(
                                  milliseconds: 750,
                                ),
                                  curve: Curves.fastOutSlowIn,);
                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),




      ),

    );
  }

  Widget onBoardBuilder(OnBoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [


    ],
  );
}




