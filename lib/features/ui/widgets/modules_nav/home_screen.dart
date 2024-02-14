import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/Services/services_logic/cubit.dart';
import 'package:n_m_c/features/Services/services_logic/state.dart';
import 'package:n_m_c/features/Services/services_model/services_model.dart';
import 'package:n_m_c/features/categories/categories_logic/categories_repo.dart';
import 'package:n_m_c/features/categories/categories_logic/cubit.dart';
import 'package:n_m_c/features/categories/categories_logic/state.dart';
import 'package:n_m_c/features/categories/categories_model/categories_model.dart';
import 'package:n_m_c/features/logic/cubit/cubit.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/slider/logic/cubit.dart';
import 'package:n_m_c/features/slider/logic/state.dart';
import 'package:n_m_c/features/ui/widgets/drawerScreens/advantageOfBloc.dart';
import 'package:n_m_c/features/ui/widgets/drawerScreens/our_customer.dart';
import 'package:n_m_c/features/ui/widgets/drawerScreens/who_we_are.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/medical_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/login/login_presentation/login/login.dart';
import '../../filtration.dart';
import '../../test.dart';
import '../drawerScreens/call_us/call_us.dart';
import '../drawerScreens/deals.dart';
import '../drawerScreens/settings.dart';
import '../gridItemHospital/hospital_grid.dart';

bool isArabic1 = true;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static Widget fourStackOnly(Data cat) => BlocConsumer<CategoriesCubit,CategoriesStates>(
    listener: (context, state) {

    },
    builder: (context, state) {

      if( state is GetSuccessCategoriesState) {

        return Stack(
          clipBehavior: Clip.none,
          // fit: StackFit.expand,
          alignment: AlignmentDirectional.topCenter,

          children: [
            Container(
                height: 160.h,
                width: 171.w,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                )),
            Positioned(

              top: 12.h,
              child: Container(

                height: 100.h,
                width: 130.w,
                decoration: BoxDecoration(

                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(

                        cat.image_url.toString(),

                      )),
                  borderRadius: BorderRadius.circular(10),),

              ),
            ),
            Positioned(
              bottom: 16.h,
              child: Text(
                '${cat.category.toString()} (${cat.MedicalNetwork})',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        return const CircularProgressIndicator();
      }
    },
  );

 static Widget builderGridView(Data cat) => BlocConsumer<CategoriesCubit,CategoriesStates>(
   listener: (context, state) {

   },
   builder: (context, state) {



            return Stack(
              clipBehavior: Clip.none,
              // fit: StackFit.expand,
              alignment: AlignmentDirectional.topCenter,

              children: [
                Container(
                    height: 160.h,
                    width: 171.w,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    )),
                Positioned(

                  top: 12.h,
                  child: Container(

                    height: 100.h,
                    width: 130.w,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(

                          cat.image_url.toString(),

                          )),
                        borderRadius: BorderRadius.circular(10),),

                  ),
                ),
                Positioned(
                  bottom: 38.h,
                  child: Text(
                    '${cat.category.toString()} (${cat.MedicalNetwork})',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );

        },
 );
 static Widget builderSecondGridView(DataServices serve) => BlocBuilder<ServicesCubit,ServicesStates>(

builder: (context, state) {


            return Stack(
              clipBehavior: Clip.none,
              // fit: StackFit.expand,
              alignment: AlignmentDirectional.topCenter,

              children: [
                Opacity(
                  opacity: 0.8,
                  child: Image.network(serve.image_url.toString(),
                      height: 160.h, width: 171.w, fit: BoxFit.fill),
                ),
                Positioned(
                  top: 70.h,
                  child: Text(
                    '${serve.title}',
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );

        },
 );
}

class _HomeScreenState extends State<HomeScreen> {

  void showLoginDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            // Handle the back button press event
            return false; // Return false to prevent dialog dismissal
          },
          child: AlertDialog(
            title: const Icon(Icons.warning, color: Colors.red),
            content:  Text(S.of(context).dialog,style: GoogleFonts.tajawal(fontSize: 16.sp ,),),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.pop(context);

                  // Navigate to the login screen
                 navigateTo(context, LogInPage());
               setState(() {
                 _timer.cancel();
               });
                },
                child: const Text('ok'),
              ),
            ],
          ),
        );
      },
    );
  }

  String? nameLogin = CacheHelper.getData(key: 'nameLogIn') ?? '';


  List <String>  search = [] ;
  late Timer _timer;
  bool isLoggedIn = false;
  int remainingTimeInMinutes = 5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
search.addAll(CategoriesCubit.get(context).allSearch);

    loadRemainingTime();
if(nameLogin == null || nameLogin == ''){
    _timer = Timer(const Duration(minutes: 5), () {
      // Show dialog after 5 minutes
      showLoginDialog();

    });

}


  }



  void searchItem(String query) {
    setState(() {
      search = CategoriesCubit.get(context).allSearch
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  @override
  void dispose() {
    // Cancel the timer
    _timer.cancel();

    // Save remaining time to shared preferences
    saveRemainingTime();

    super.dispose();
  }
  String selectedLanguage = 'العربية';
  void _showLanguageMenu(BuildContext context) async {
    String? result = await showMenu(
      context: context,

      position:  RelativeRect.fromLTRB(50.w, 150.h, 50.w, 0),
      items: [
        PopupMenuItem(
          value: 'العربية',
          child: Row(
            children: [
             const Text('العربية'),
              const  Spacer(),
              if (selectedLanguage == 'العربية') const Icon(Icons.check, color: primaryColor,size: 20,),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'English',
          child: Row(
            children: [
             const Text('English'),
             const  Spacer(),
              if (selectedLanguage == 'English') const Icon(Icons.check, color: primaryColor,size: 20,),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    );

    if (result != null) {
      setState(() {
        selectedLanguage = result;
       if ( result == 'العربية') {
         isArabic1 = true;
         AppCubit.get(context).changeSelect(isArabic1);

      } else {
         isArabic1 = false;
         AppCubit.get(context).changeSelect(isArabic1);
       }
      });




    }
  }

  void loadRemainingTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      remainingTimeInMinutes = prefs.getInt('remainingTime') ?? 5;
    });
  }
  var  getlastNameRegister = CacheHelper.getData(key: 'LstnameLogIn');

  void saveRemainingTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('remainingTime', remainingTimeInMinutes);
  }
  var PageControl = PageController();
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SafeArea(child: BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) =>  Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
leading:  Builder(
        builder: (BuildContext context) {
          return IconButton(
            padding: EdgeInsets.zero,

            icon:  SvgPicture.asset('assets/images/menu.svg',fit: BoxFit.cover, ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations
                .of(context)
                .openAppDrawerTooltip,
          );
        },  ),
backgroundColor: Colors.white,

elevation: 0.0,
          title: SvgPicture.asset('assets/images/logo_all.svg'),

          centerTitle: true,
          actions: [
            Center(
        child: nameLogin == null || nameLogin == '' ?
          InkWell(
            onTap: ()
            {
              navigateTo(context, LogInPage());
            },
            child: Text( S.of(context).Login,  textDirection: TextDirection.rtl,

            style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor,

            ),),
          )
            : Text( '${S.of(context).hello_user}$nameLogin',  textDirection: TextDirection.rtl,

        style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor,

        ),),
            ),
Padding(
  padding: const EdgeInsets.only(left: 8.0),
  child:   SvgPicture.asset('assets/images/ph_hand-waving-thin.svg',),
),
          ],

        ),

drawer: Drawer(

  backgroundColor: Colors.white,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(height: 64.h,),

        InkWell(
          onTap: ()
          {
            navigateTo(context, const Deals() );
          },
          child: Container(
            decoration: BoxDecoration(color: fillRectangular,
            borderRadius: BorderRadius.circular(8),
            ),

            height: 50.h,
            width: 250.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

  children: [
            SvgPicture.asset('assets/images/shake.svg'),
          SizedBox(width: 8.w,),
  Text(S.of(context).contracts,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
   ], ),
          ),
        ),
          SizedBox(height: 16.h,),
          InkWell(
            onTap: ()
            {
              navigateTo(context, const MedicalCard());
            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/id.svg'),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).HeaderListCart,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
                ], ),
            ),
          ),
          SizedBox(height: 16.h,),
          InkWell(
            onTap: ()
            {
              navigateTo(context, const AdavantageOfCard() );
            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/wesam.svg'),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).cart,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
                ], ),
            ),
          ),
          SizedBox(height: 16.h,),
          InkWell(
            onTap: ()
            {
              navigateTo(context, const  OurCustomer(), );
            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/2user.svg'),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).customers,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
                ], ),
            ),
          ),
          SizedBox(height: 16.h,),
          InkWell(
            onTap: ()
            {
            navigateTo(context, const WhoWeAre() );
            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/info.svg',),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).HeaderListA,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
                ], ),
            ),
          ),
          SizedBox(height: 16.h,),
          InkWell(
            onTap: ()
            {
              navigateTo(context,  CallUs());
            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/call.svg'),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).HeaderListC,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
                ], ),
            ),
          ),
          getlastNameRegister != null ?  SizedBox(height: 16.h,) : Container(),
          getlastNameRegister != null ?   InkWell(
            onTap: ()
            {
              navigateTo(context, Settings());
            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/setting.svg'),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).Setting,style: GoogleFonts.tajawal(fontSize: 16.sp,color: mainLineColor),),
                ], ),
            ),
          ) : Container(),



          SizedBox(height: 16.h,),
          InkWell(
            onTap: () async
            {
              await CacheHelper.clearAll().then((value) {
                value = true;
                if (value) {
                  navigateTo(context, LogInPage());
                }
              });

            },
            child: Container(
              decoration: BoxDecoration(color: fillRectangular,
                borderRadius: BorderRadius.circular(8),
              ),

              height: 45.h,
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SvgPicture.asset('assets/images/log_out.svg'),
                  SizedBox(width: 5.w,),
                  Text(S.of(context).buttonExit,style: GoogleFonts.tajawal(fontSize: 16.sp,
                      color: mainLineColor),),
                ], ),
            ),
          ),

          SizedBox(height: 16.h,),
          Center(child: Lottie.asset('assets/animation/Animation - 1703882843053.json',height: 150.h,width: 150.w)),


        ],
        ),
      ),
      ),
        body: BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) {

          },
          builder: (context, state) =>  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
      SizedBox(
              height: 16.h,
      ),
               /// ///////////

                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async
                          {

                            _showLanguageMenu(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(color: fillRectangular,
                              borderRadius: BorderRadius.circular(8),
                            ),

                            height: 45.h,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                SvgPicture.asset('assets/images/world-solid.svg',
                                  height: 26.h,
                                  color: mainLineColor.withOpacity(0.5),
                                ),
                                SizedBox(width: 5.w,),
                                Text('${S.of(context).language} $selectedLanguage',style: GoogleFonts.tajawal(fontSize: 16.sp,
                                    color: mainLineColor),),
                              ], ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10.w,),
                      Expanded(
                        child: InkWell(
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
                                Text(S.of(context).filter,style: GoogleFonts.tajawal(fontSize: 16.sp,
                                    color: mainLineColor),),
                              ], ),
                          ),
                        ),
                      ),
                    ],
                  ),

//  searchTextField(
//      context: context,
//      search: (value) => searchItem(value),
//
//      onTap: ()
//  {
//    setState(() {
//      isSearch = true;
//    });
//  }
//  , onTapOutside: (tap)
//      {
//       setState(() {
//         isSearch = false;
//       });
//      }
// ,onSaved: (tap)
//      {
//        setState(() {
//          isSearch = false;
//        });
//      }
//  ),

                   SizedBox(height: 16.h,),


                // isSearch ?  ListView.builder(
                //
                //   shrinkWrap: true,
                //   itemCount: search.length,
                //   itemBuilder: (context, index) {
                //     return
                //       InkWell(
                //         onTap: ()
                //         {
                //
                //           navigateTo(context, HospitalGridMain(title: search[index].toString()));
                //         },
                //         child: Container(
                //
                //           decoration: BoxDecoration(
                //             color: primaryColor,
                //             borderRadius: BorderRadius.circular(20.0),
                //           ),
                //           margin: EdgeInsets.symmetric(vertical: 10.0.h),
                //           child: ListTile(
                //
                //             shape: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //           title: Padding(
                //             padding: const EdgeInsets.all(16.0),
                //             child: Text(search[index],style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold),),
                //           ),
                //     ),
                //         ),
                //       );
                //   },
                // )
                //     :
                Column(children: [
                    BlocBuilder<SliderCubit,SliderStates>(
                        builder:(context, state) {
                          if(state is GetImageSliderState) {

                            return   Column(
                              children: [
                                CarouselSlider(

                                    items: [



                                      Card(
                                          elevation : 8.0 ,
                                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Image.network(SliderCubit.get(context).imageSlider![0].image_url.toString())),
                                      //  Image.network(image.toString()),


                                    ],

                                    options: CarouselOptions(

                                      height: 158.0,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      viewportFraction: 1.0,
                                      autoPlayInterval: const Duration(seconds: 4),
                                      autoPlayAnimationDuration: const Duration(seconds: 1),
                                      //the best shape
                                      autoPlayCurve: Curves.easeIn,
                                      scrollDirection: Axis.horizontal,
                                    )),

                              ],
                            );

                          }
                          else {
                            return   Lottie.asset('assets/animation/Animation - 1703883437162.json');

                          }
                        }
                    ),

                    SizedBox(height: 16.h,),
                    Row(

                      children: [
                        Text(S.of(context).HeaderListN,style: GoogleFonts.tajawal(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const Spacer(),
                        TextButton(

                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: ()
                            {
                              navigateTo(context, cubit.screens[1]);
                            },
                            child:  Text(

                              S.of(context).more,style: GoogleFonts.tajawal(
                              fontSize: 16.sp,

                            ),
                              textAlign: TextAlign.end,

                            )),
                      ],
                    ),
                    BlocConsumer<CategoriesCubit,CategoriesStates>(
                      listener: (context, state) {

                      },
                      builder: (context, state) {
                        if(state is GetLoadingCategoriesState) {
                          return  Center(
                          child:    Lottie.asset('assets/animation/Animation - 1703883437162.json'),
                          );  }
                        if(state is GetSuccessCategoriesState) {
                          return Column(children: [

                            Row(children: [
                              InkWell(
                                  onTap: (){
                                    navigateTo(context,  HospitalGridMain(title: CategoriesCubit.get(context).data![0].category,));
                                  },
                                  child: HomeScreen.fourStackOnly(CategoriesCubit.get(context).data![0])),
                              SizedBox(width: 16.h,),
                              InkWell(
                                  onTap: (){
                                    navigateTo(context,  HospitalGridMain(title: CategoriesCubit.get(context).data![1].category,));
                                  },
                                  child: HomeScreen.fourStackOnly(CategoriesCubit.get(context).data![1])),
                            ]),
                            SizedBox(height: 16.h,),
                            Row(children: [
                              InkWell(
                                  onTap: (){
                                    navigateTo(context,  HospitalGridMain(title: CategoriesCubit.get(context).data![2].category,));
                                  },
                                  child: HomeScreen.fourStackOnly(CategoriesCubit.get(context).data![2])),
                              SizedBox(width: 16.h,),
                              InkWell(
                                  onTap: (){
                                    navigateTo(context,  HospitalGridMain(title: CategoriesCubit.get(context).data![3].category,));
                                  },
                                  child: HomeScreen.fourStackOnly(CategoriesCubit.get(context).data![3])),
                            ]),
                          ]);
                        }
                        else if (state is GetErrorCategoriesState )  {
                          return  Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(S.of(context).connection_data,style: GoogleFonts.tajawal(),),

                              SizedBox(
                                height: 24.h,
                              ),
                               Center(
                                  child:  Lottie.asset('assets/animation/Animation - 1703883437162.json'),
                          ),
                            ], ),);
                        }
                        else {
                          return  Center(
                              child:  Lottie.asset('assets/animation/Animation - 1703883437162.json'),
                          );   }
                      },


                    ),

                    SizedBox(
                      height: 24.h,
                    ),

                    InkWell(
                      onTap: () {
                        navigateTo(context, const MedicalCard());
                      },
                      child:   Container(

                        height: 70.h,

                        width: double.infinity,

                        decoration:BoxDecoration(

                          boxShadow:  [

                            BoxShadow(

                              color: Colors.grey.shade400,

                              blurRadius: 6,



                              offset: const Offset(8, 8), // Shadow position

                            ),

                          ],

                          color: fillRectangular,

                          borderRadius: BorderRadius.circular(20),



                        ) ,



                        padding: EdgeInsets.symmetric(horizontal: 16.w),

                        child: Row(

                          children: [

                            SvgPicture.asset('assets/images/id.svg',

                              color: primaryColor,),

                            SizedBox(width: 8.w,),

                            Text(S.of(context).HeaderListCart,

                              style: GoogleFonts.tajawal(

                                fontSize: 20.sp,



                                color: primaryColor,

                                fontWeight: FontWeight.w600,

                              ),

                            ),

                          const  Spacer(),

                            SvgPicture.asset('assets/images/idea.svg',

                              color: primaryColor,),

                          ],





                        ),

                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(S.of(context).service,style: GoogleFonts.tajawal(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    BlocBuilder<ServicesCubit,ServicesStates>(
                        builder: (context, state) {

                          if (state is GetLoadingServicesState)
                          {return   Center(
                            child:  Lottie.asset('assets/animation/Animation - 1703883437162.json'),

                          );}
                          else {
                            return
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 1.0,
                                crossAxisSpacing: 1.0,
                                // childAspectRatio: 1/ 1.72,

                                crossAxisCount: 2,
                                //number of them
                                children: List.generate(
                                  ServicesCubit.get(context).dataServices!.length,
                                      (index) => HomeScreen.builderSecondGridView(
                                      ServicesCubit.get(context)
                                          .dataServices![index]),
                                ),
                              );
                          }

                        }
                    ),




                  ],),








              ],
              ),
            ),
          ),

          ),
        ),
      ),
    );
  }
}
