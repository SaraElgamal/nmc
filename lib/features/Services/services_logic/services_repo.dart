

import 'package:n_m_c/features/auth/Register/register_model/register_model.dart';
import 'package:n_m_c/features/definition/definition_model.dart';

import '../../../../core/web_services/web_services.dart';
import '../../footer/footer_model.dart';
import '../../ui/widgets/drawerScreens/call_us/callus_model/call_us_model.dart';
import '../services_model/services_model.dart';



class ServicesRepository
{
  final WebServices webServices ;

  ServicesRepository(this.webServices);

  Future<ServicesModel> getServices () async
  {
  return  await webServices.getServices();
  }

  Future<MessageSend> sendMessage (MessageSend info) async
  {
    return  await webServices.sendMessage(info);
  }

  Future<FooterModel> getFooter () async
  {
    return  await webServices.getFooter();
  }


  Future<DefinitionCard> getDefinition () async
  {
    return  await webServices.getDefinition();
  }

  Future<EngagementT> getAllEngagements () async
  {
    return  await webServices.getAllEngagements();
  }


  Future<CardFeaturesContent> getCardFeaturesContent () async
  {
    return  await webServices.getCardFeaturesContent();
  }


  Future<CardFeaturesImages> getImageCardFeatures () async
  {
    return  await webServices.getImageCardFeatures();
  }


  Future<OurCustomers> allCustomer () async
  {
    return  await webServices.allCustomer();
  }


}
