


import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/core/constant/end_points/end_point.dart';
import 'package:n_m_c/features/auth/login/login_model/login_model.dart';

import '../../../../core/constant/const/const.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/web_services/web_services.dart';
import '../../Register/register_model/register_model.dart';



class LoginRepository
{
  final WebServices webServices ;

  LoginRepository(this.webServices);
  Future <bool> result =  InternetConnectionChecker().hasConnection;

  Future<LoginModel> loginUser( Client client) async
  {
    if(await result ==false)
    {
      showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
    }
    var response = await webServices.loginUser(client, 'Bearer $token' );
    return response;
  }

  Future<LoginModel> editProfile( Client client) async
  {
    if(await result ==false)
    {
      showToast(text: 'أنت غير متصل بالانترنت', state: ToastStates.error);
    }
    var response = await webServices.editProfile(client, 'Bearer $authToken' );
    return response;
  }

}
