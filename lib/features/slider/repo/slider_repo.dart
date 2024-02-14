

import 'dart:developer';

import '../../../core/web_services/web_services.dart';
import '../dataModel/slider_model.dart';

class SliderRepository
{
  final WebServices webServices ;

  SliderRepository(this.webServices);

    Future<SliderModel> getSlider() async {
      var res = await webServices.getSlider();
      return res;
    }
}