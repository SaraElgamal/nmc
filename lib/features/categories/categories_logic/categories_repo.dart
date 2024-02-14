

import 'dart:developer';

import '../../../../core/constant/const/const.dart';
import '../../../../core/web_services/web_services.dart';
import '../categories_model/categories_model.dart';



class CategoriesRepository
{
  final WebServices webServices ;

  CategoriesRepository(this.webServices);

  Future<CategoryModel> getCategory () async
  {
  return  await webServices.getCategory();
  }

}
