

import 'package:dio/dio.dart';
import 'package:n_m_c/features/auth/Register/register_model/register_model.dart';
import 'package:n_m_c/features/auth/login/login_model/login_model.dart';
import 'package:n_m_c/features/categories/categories_model/categories_model.dart';
import 'package:n_m_c/features/footer/footer_model.dart';
import 'package:n_m_c/features/ui/widgets/drawerScreens/call_us/callus_model/call_us_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/Services/services_model/services_model.dart';
import '../../features/categories/types_of_cat/cat_items/all_cat_item_model/all_cat_item_model.dart';
import '../../features/definition/definition_model.dart';
import '../../features/payment/excutePayment/excute_payment_model.dart';
import '../../features/payment/get_card_model/get_card_model.dart';
import '../../features/payment/payment_model/payment_model.dart';
import '../../features/slider/dataModel/slider_model.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: ('https://api.nmc.com.eg/public/'))
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  @GET('api/slider')
  Future<SliderModel> getSlider () ;

  @POST('api/auth/register')
  Future<Register> createNewUser(@Body() Client client , @Header('Authorization') String token);

  @POST('api/auth/login')
  Future<LoginModel> loginUser(@Body() Client client , @Header('Authorization') String token);

  @GET('api/getCategoryProductCounts')
  Future<CategoryModel> getCategory () ;

  @GET('api/service')
  Future<ServicesModel> getServices () ;


  @GET('api/getMedicalNetworkByCategory/مستشفيات')
  Future<AllCategoriesItemModel> getHospitals () ;

  @GET('api/getMedicalNetworkByCategory/عيادات')
  Future<AllCategoriesItemModel> getClinic () ;

  @GET('api/getMedicalNetworkByCategory/بصريات')
  Future<AllCategoriesItemModel> getBasareyat () ;


  @GET('api/getMedicalNetworkByCategory/صيدليات')
  Future<AllCategoriesItemModel> getPharmacy () ;

  @GET('api/getMedicalNetworkByCategory/معامل تحاليل')
  Future<AllCategoriesItemModel> getLab () ;

  @GET('api/getMedicalNetworkByCategory/مراكز تخصصية')
  Future<AllCategoriesItemModel> getMarakez () ;

  @GET('api/getMedicalNetworkByCategory/مراكز أشعه')
  Future<AllCategoriesItemModel> getAshea () ;

  @GET('api/getMedicalNetworkByCategory/مراكز طبيه')
  Future<AllCategoriesItemModel> getTebeya () ;

  @GET('api/getMedicalNetworkByCategory/جيم - صالات رياضية')
  Future<AllCategoriesItemModel> getGym () ;

  @GET('api/getMedicalNetworkByCategory/بيوتي سنتر')
  Future<AllCategoriesItemModel> getBeauty () ;

  @GET('api/getMedicalNetworkByCategory/حضانات تعليمية')
  Future<AllCategoriesItemModel> getHadanat () ;

  @GET('api/getMedicalNetworkByCategory/عيادات بيطرية')
  Future<AllCategoriesItemModel> getBetareya () ;

  @GET('api/footer')
  Future<FooterModel> getFooter () ;


  @GET('api/getDefinition')
  Future<DefinitionCard> getDefinition () ;


/// /////////////////
  @GET('api/allEngagements')
  Future<EngagementT> getAllEngagements () ;

  @GET('api/getCardFeatures')
  Future<CardFeaturesContent> getCardFeaturesContent () ;

  @GET('api/getimageCardFeatures')
  Future<CardFeaturesImages> getImageCardFeatures () ;


  @GET('api/allCustomer')
  Future<OurCustomers> allCustomer () ;
  /// /////////////////
  @POST('api/sendMessage')
  Future<MessageSend> sendMessage (@Body() MessageSend info) ;


  @POST('api/auth/edite-profile')
  Future<LoginModel> editProfile (@Body() Client client , @Header('Authorization') String token) ;

  @POST('api/executePayment')
  Future<ExcutePayment> excutePayment (@Body() BodyOfExcutePayment bodyOfExcutePayment ) ;


  @GET('api/show/{phone}')
  Future<GetCardAfter> getCardAfter (@Path('phone') String phone) ;

  @POST('api/bookings')
  Future<GetCardAfter> bookingCard (@Body() CardM card ,@Header('Content-Type') String ContentType) ;


}