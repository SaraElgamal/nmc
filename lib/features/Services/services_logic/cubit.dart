
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n_m_c/core/utils/toast.dart';
import 'package:n_m_c/features/Services/services_logic/state.dart';
import 'package:n_m_c/features/Services/services_model/services_model.dart';
import 'package:n_m_c/features/auth/Register/register_logic/register_repo.dart';
import 'package:n_m_c/features/auth/Register/register_logic/state.dart';
import 'package:n_m_c/features/categories/categories_logic/state.dart';
import 'package:n_m_c/features/definition/definition_model.dart';
import 'package:n_m_c/features/footer/footer_model.dart';
import 'package:n_m_c/features/ui/widgets/drawerScreens/call_us/callus_model/call_us_model.dart';

import '../../auth/Register/register_model/register_model.dart';
import 'services_repo.dart';


class ServicesCubit extends Cubit<ServicesStates> {
  ServicesRepository servicesRepo;

  ServicesCubit(this.servicesRepo) : super(InitialServicesState());

  static ServicesCubit get(context) => BlocProvider.of(context);
List<DataServices>? dataServices  = [];
List<DataFooter>? footer  = [];
  getServicesNetwork() async
  {
    emit(GetLoadingServicesState());
    await servicesRepo.getServices().then((services) => {
      dataServices = services.data,
    emit(GetSuccessServicesState()),
   


    });
  }
  getMessageCallUsNetwork({
    required String? firstName,
    required String? email,
    required String? phone,
    required String? detail,

}) async
  {
    await servicesRepo.sendMessage(
      MessageSend(
        Name: firstName,
        Email: email,
        PhoneNumber: phone,
        TheMessage: detail,

         ),
    ).then((send) => {
      showToast(text: send.message!, state: ToastStates.success),
      emit(GetCallUsState()),
      print(send.message),


    }).catchError((error){
      showToast(text: 'حدث خطأ أثناء معالجة البيانات', state: ToastStates.error);
      print(error.toString());
    });
  }

  getFooterNetwork() async
  {
    await servicesRepo.getFooter().then((foot) => {
      footer = foot.data,
      emit(GetSuccessFooterState()),
      print(footer![0].phoneNumber),


    });
  }
  List<DataDefinition>? define  = [];
  getDefinition() async
  {
    await servicesRepo.getDefinition().then((definition) => {
      define = definition.data,
      emit(GetSuccessDefinitionState()),
     print(define![0].image_url.toString()),



    });
  }


  List<DataEngagement>? engage  = [];
  getEngagementT() async
  {
    emit(GetLoadingEngagementsState());
    await servicesRepo.getAllEngagements().then((engages) => {
      engage = engages.data,
      emit(GetSuccessEngagementsState()),

    });
  }


  List? customers  = [];
  getOurCustomers() async
  {
    await servicesRepo.allCustomer().then((custom) => {
      customers = custom.data,
      emit(GetSuccessOurCustomersState()),

    });
  }


  List<DataCardFeaturesContent>? contentFCard  = [];
  getCardFeaturesContent() async
  {
    await servicesRepo.getCardFeaturesContent().then((content) => {
      contentFCard = content.data,
      emit(GetSuccessCardFeaturesContentState()),




    });
  }


  List<DataCardFeatures>? CardFImage  = [];
  getCardFeaturesImage() async
  {
    await servicesRepo.getImageCardFeatures().then((image) => {
      CardFImage = image.data,
      emit(GetSuccessCardFeaturesImagesState()),




    });
  }
}

