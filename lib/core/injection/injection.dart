

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:n_m_c/core/web_services/getPayServices.dart';
import 'package:n_m_c/features/auth/Register/register_logic/cubit.dart';
import 'package:n_m_c/features/auth/login/login_logic/login_repo.dart';
import 'package:n_m_c/features/auth/login/login_logic/login_repo.dart';
import 'package:n_m_c/features/categories/categories_logic/categories_repo.dart';
import 'package:n_m_c/features/categories/categories_logic/cubit.dart';
import 'package:n_m_c/features/categories/categories_model/categories_model.dart';
import 'package:n_m_c/features/logic/cubit/cubit.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/cubit.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/repo.dart';
import 'package:n_m_c/features/payment/payment_logic/cubit.dart';
import 'package:n_m_c/features/payment/payment_logic/cubit.dart';
import 'package:n_m_c/features/payment/payment_logic/repo.dart';
import 'package:n_m_c/features/payment/payment_logic/repo.dart';
import 'package:n_m_c/features/slider/dataModel/slider_model.dart';
import 'package:n_m_c/features/slider/logic/cubit.dart';
import 'package:n_m_c/features/slider/logic/cubit.dart';
import 'package:n_m_c/features/slider/repo/slider_repo.dart';

import '../../features/Services/services_logic/cubit.dart';
import '../../features/Services/services_logic/services_repo.dart';
import '../../features/auth/Register/register_logic/register_repo.dart';
import '../../features/auth/login/login_logic/cubit.dart';
import '../../features/categories/types_of_cat/cat_items/all_cat_items_logic/cubit.dart';
import '../../features/categories/types_of_cat/cat_items/all_cat_items_logic/repo.dart';

import '../web_services/web_services.dart';



final getIt = GetIt.instance;

void getInit() {
  getIt.registerLazySingleton<WebServices> (() => WebServices(createSetupDio()));
  getIt.registerLazySingleton<PayServices> (() => PayServices(createSetupDio()));
  getIt.registerLazySingleton<PaymentRepository> (() => PaymentRepository(getIt()));
  getIt.registerLazySingleton<PaymentCubit> (() => PaymentCubit(getIt()));
  getIt.registerLazySingleton<AppCubit> (() => AppCubit());
  getIt.registerLazySingleton<SliderCubit> (() => SliderCubit(getIt()));
  getIt.registerLazySingleton<RegisterRepository> (() => RegisterRepository(getIt()));
  getIt.registerLazySingleton<RegisterCubit> (() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<LoginCubit> (() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepository> (() => LoginRepository(getIt()));
  getIt.registerLazySingleton<CategoriesCubit> (() => CategoriesCubit(getIt()));
  getIt.registerLazySingleton<CategoriesRepository> (() => CategoriesRepository(getIt()));

  getIt.registerLazySingleton<ServicesCubit> (() => ServicesCubit(getIt()));
  getIt.registerLazySingleton<ServicesRepository> (() => ServicesRepository(getIt()));
  getIt.registerLazySingleton<SliderRepository> (() => SliderRepository(getIt()));
  getIt.registerLazySingleton<ClinicCubit> (() => ClinicCubit(getIt()));
  getIt.registerLazySingleton<ClinicRepository> (() => ClinicRepository(getIt()));
  getIt.registerLazySingleton<CardCubit> (() => CardCubit(getIt()));
  getIt.registerLazySingleton<CardRepo> (() => CardRepo(getIt()));
}
Dio createSetupDio()
{
  Dio dio = Dio () ;

  dio.interceptors.add(LogInterceptor(
    error: true ,
    request: true,
    requestHeader: false ,
    responseBody: true,
    requestBody: true,
    responseHeader: false,


  ));
  dio.options.followRedirects = false;
  dio.options.validateStatus =
      (status) => status != null &&  status < 500;
  dio.options.maxRedirects = 0;



  return dio;
}