import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:n_m_c/core/injection/injection.dart';
import 'package:n_m_c/features/auth/Register/register_logic/cubit.dart';
import 'package:n_m_c/features/auth/login/login_logic/cubit.dart';
import 'package:n_m_c/features/categories/categories_logic/cubit.dart';
import 'package:n_m_c/features/logic/cubit/cubit.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/payment/payment_logic/cubit.dart';
import 'package:n_m_c/features/slider/logic/cubit.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/home_screen.dart';

import 'dart:ui';

import 'core/data_base/cache_helper/cache_helper.dart';
import 'core/data_base/filtration_model.dart';
import 'core/utils/check_internet.dart';
import 'features/Services/services_logic/cubit.dart';

import 'features/categories/types_of_cat/cat_items/all_cat_items_logic/cubit.dart';
import 'features/payment/CodePage.dart';
import 'features/payment/excutePayment/card_logic/cubit.dart';
import 'features/payment/way_to_pay.dart';
import 'features/ui/filtration.dart';
import 'features/ui/on_boarding.dart';
import 'features/ui/test.dart';
import 'features/ui/widgets/drawerScreens/call_us/call_us.dart';
import 'features/ui/widgets/splash_screen.dart';
import 'generated/l10n.dart';


void main() async {
  getInit();
  Widget widget;
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkInfoImpl().checkInternet();
  await CacheHelper.init();

  // if (loginToken != null) {
  //   widget =  const HomeScreen();
  // } else {
  //   widget = const SplashScreen(animateBottom: true);
  // }
  runApp( MyApp());

}



class MyApp extends StatelessWidget {
  // final Widget startWidget;
  // const MyApp(this.startWidget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


          return  ScreenUtilInit(
            designSize: const Size(
                390,
                844
            ),
            minTextAdapt: true,
            splitScreenMode: true,
            builder:(context, child) {
              return  MultiBlocProvider(
                providers: [
                  BlocProvider(
                  create: (context) => getIt<AppCubit>(),

                ),
                  BlocProvider(
                    create: (context) => getIt<SliderCubit>()..getSliderImage(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<RegisterCubit>(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<LoginCubit>(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<CategoriesCubit>()..getCategoriesNetwork()..fetchData(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<ServicesCubit>()..getServicesNetwork()..getFooterNetwork()..getDefinition()..getCardFeaturesImage()..getCardFeaturesContent()..getEngagementT()..getOurCustomers(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<ClinicCubit>()..getClinicNetwork()..getBasareyatNetwork()..getMarakezNetwork()..getAsheaNetwork()..getBeautyNetwork()..getBetareyaNetwork()..getGymNetwork()..getHadanatNetwork()..getHospitalNetwork()..getPharmacyNetwork()..getLabNetwork()..getTebeyaNetwork(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<PaymentCubit>(),

                  ),
                  BlocProvider(
                    create: (context) => getIt<CardCubit>(),

                  ),
                ],
                  child:
                        BlocConsumer<AppCubit,AppStates>(
                          listener: (context, state) {

                          },
                          builder: (context, state) => MaterialApp(
                            locale:
                            AppCubit.get(context).isArabicSelected ? const Locale('ar') : const Locale('en'),
                            localizationsDelegates: const [

                              S.delegate,
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
                            supportedLocales: S.delegate.supportedLocales,
                            theme: ThemeData(

                              primarySwatch: Colors.purple,
                              textTheme: TextTheme(
                                titleMedium: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            home:    OnBoardingScreen(),
                            //SplashScreen(),
                            debugShowCheckedModeBanner: false,
                          ),
                        ),

              );
            },

          );





  }
}

bool isArabic ()
{
  return Intl.getCurrentLocale() == 'ar';
}