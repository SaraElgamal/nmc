


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/core/data_base/cache_helper/cache_helper.dart';

import 'package:n_m_c/features/payment/payment_logic/repo.dart';
import 'package:n_m_c/features/payment/payment_logic/state.dart';
import 'package:n_m_c/features/payment/payment_model/payment_model.dart';

import '../../../core/utils/toast.dart';



class PaymentCubit extends Cubit<PaymentStates> {
  PaymentRepository paymentRepo;

  PaymentCubit(this.paymentRepo) : super(InitialPaymentStates());
  Future<bool> result = InternetConnectionChecker().hasConnection;

  static PaymentCubit get(context) => BlocProvider.of(context);
  List<DataPayment>? data = [];
List<int?> paymentIdCatch = [];
  getPaymentNetwork() async
  {
    await paymentRepo.getPayment().then((pay) =>
    {

      data = pay.data,
      for (int x  = 0 ; x < pay.data!.length ; x++ ) {
         paymentIdCatch.add(pay.data![x].paymentId) ,
      },

      // CacheHelper.saveData(key: 'idPayment', value: paymentIdCatch),
       emit(GetSuccessPaymentStates()),
    }).catchError((onError) async {
      if ( await result == false) {
        showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);

      } else {
        emit(GetErrorPaymentStates());
        print('errrrrrr ${onError.toString()}');
      } });

  }

}

