

import 'package:dio/dio.dart' hide Headers;
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/payment/payment_model/payment_model.dart';

part 'getPayServices.g.dart';

@RestApi(baseUrl: ('https://app.fawaterk.com/'))

abstract class PayServices {
  factory PayServices(Dio dio, {String baseUrl}) = _PayServices;


  @GET('api/v2/getPaymentmethods')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer 5e1e355f65f639da2dce8757191933f3b1b0039dcc56e6ceeb',
  })
  Future<PaymentMethod> getPayment () ;

}