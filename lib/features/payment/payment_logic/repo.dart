

import 'dart:developer';

import 'package:n_m_c/core/web_services/getPayServices.dart';
import 'package:n_m_c/features/payment/payment_model/payment_model.dart';

class PaymentRepository
{
  final PayServices payServices ;

  PaymentRepository(this.payServices);

  Future<PaymentMethod> getPayment () async
  {
    return  await payServices.getPayment();
  }

}
