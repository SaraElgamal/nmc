

import 'dart:developer';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/constant/const/const.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/web_services/web_services.dart';
import '../register_model/register_model.dart';


class RegisterRepository
{
  final WebServices webServices ;

  RegisterRepository(this.webServices);
  Future <bool> result =  InternetConnectionChecker().hasConnection;

  Future<Register> createNewUser( Client client) async
  {
    if(await result ==false)
    {
      showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
    }
  var response = await webServices.createNewUser(client, 'Bearer $token' );
  return response;
  }

  }
