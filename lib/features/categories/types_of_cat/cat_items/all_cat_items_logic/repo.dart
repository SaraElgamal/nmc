



import '../../../../../core/web_services/web_services.dart';

import '../all_cat_item_model/all_cat_item_model.dart';


class ClinicRepository
{
  final WebServices webServices ;

  ClinicRepository(this.webServices);

  Future<AllCategoriesItemModel> getHospitals () async
  {
    return  await webServices.getHospitals();
  }
  Future<AllCategoriesItemModel> getClinic () async
  {
    return  await webServices.getClinic();
  }
  Future<AllCategoriesItemModel> getBasareyat () async
  {
    return await webServices.getBasareyat();
  }
  Future<AllCategoriesItemModel> getPharmacy () async
  {
    return await webServices.getPharmacy();
  }
  Future<AllCategoriesItemModel> getLab () async
  {
    return await webServices.getLab();
  }
  Future<AllCategoriesItemModel> getMarakez () async
  {
    return await webServices.getMarakez();
  }

  Future<AllCategoriesItemModel> getAshea () async
  {
    return await webServices.getAshea();
  }
  Future<AllCategoriesItemModel> getTebeya () async
  {
    return await webServices.getTebeya();
  }
  Future<AllCategoriesItemModel> getGym () async
  {
    return await webServices.getGym();
  }
  Future<AllCategoriesItemModel> getBeauty () async
  {
    return await webServices.getBeauty();
  }
  Future<AllCategoriesItemModel> getHadanat () async
  {
    return await webServices.getHadanat();
  }
  Future<AllCategoriesItemModel> getBetareya () async
  {
    return await webServices.getBetareya();
  }
}
