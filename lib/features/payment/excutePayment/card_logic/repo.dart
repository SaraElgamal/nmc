
import 'package:n_m_c/features/payment/excutePayment/excute_payment_model.dart';

import '../../../../core/web_services/web_services.dart';
import '../../get_card_model/get_card_model.dart';

class CardRepo {
  final WebServices webServices;

  CardRepo(this.webServices);

  Future<GetCardAfter> getCardAfter( String phone) async
  {
    return  await webServices.getCardAfter(phone);
  }

  Future<ExcutePayment> excutePayment (BodyOfExcutePayment bodyOfExcutePayment) async
  {
    return  await webServices.excutePayment(bodyOfExcutePayment);
  }

  Future<GetCardAfter> bookingCard ( CardM card )
  async
  {
    return  await webServices.bookingCard(card,'multipart/form-data; boundary=<calculated when request is sent>' );

  }
}