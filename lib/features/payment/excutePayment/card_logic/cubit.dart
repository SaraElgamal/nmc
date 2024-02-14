

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:n_m_c/core/data_base/cache_helper/cache_helper.dart';
import 'package:n_m_c/core/utils/toast.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/repo.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/state.dart';
import 'package:n_m_c/features/payment/excutePayment/excute_payment_model.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/registration.dart';

import '../../get_card_model/get_card_model.dart';

class CardCubit extends Cubit<CardStates> {
  CardRepo cardRepo;

  CardCubit(this.cardRepo) : super(InitialCardState());

  static CardCubit get(context) => BlocProvider.of(context);
  Future<bool> result = InternetConnectionChecker().hasConnection;
 String? invoice ;

  String? Link ;
  int? Code ;
  String? CodeFawry ;

  String? expireDate ;
  // int payment_method_id = CacheHelper.getData(key: 'RightIdPayment');
bool p = false ;
 postExcutePayment({
    required String first_name ,
    required String last_name ,
    required String email ,
    required String phone ,
    required String address ,
    required String card_type ,
    required int price ,
    required int payment_method_id ,
    required int cartTotal ,

}) async
 {
await cardRepo.excutePayment(
    BodyOfExcutePayment(
first_name: first_name,
last_name: last_name,
email: email,
phone: phone,
address: address,
card_type: card_type,
price: price,
payment_method_id: payment_method_id ,
cartTotal: cartTotal ,
)).then((value) {
  print('this is get id now $payment_method_id   $payment_method_id');

  if(payment_method_id == 2 || payment_method_id == 11) {
    Link = value.data!.data!.payment_data!.redirectTo;
    print(payment_method_id );
    print(Link );
    print('kkkkkkkkkkkkk2 || 11' );

    p = true ;
  } else if (payment_method_id == 3){
    CodeFawry = value.data!.data!.payment_data!.fawryCode;

    print(payment_method_id );
    print(CodeFawry );
    print('cccccccccccc3' );
    p = false ;
  }
  else if (payment_method_id == 4){
    Code =value.data!.data!.payment_data!.meezaReference;
    print(payment_method_id );
    print(Code );
    print('cccccccccccc4' );
    p = false ;
  }

  else if (payment_method_id == 12){
    Code =value.data!.data!.payment_data!.amanCode;

    print(payment_method_id );
    print(Code );
    print('cccccccccccc12' );
    p = false ;
  }
  else if (payment_method_id == 14){
    Code =value.data!.data!.payment_data!.masaryCode;

    print(payment_method_id );
    print(Code );
    print('cccccccccccc14' );
    p = false ;
  }
  invoice =  value.data!.data!.invoice_key;
  CacheHelper.saveData(key: 'invoice', value: invoice);

 // expireDate = value.data!.data!.payment_data!.expireDate;
 //  CacheHelper.saveData(key: 'expireDate', value: expireDate);

  emit(PostSuccessExcutePayCardState());

  var getFullName = CacheHelper.getData(key: 'fullName');
  var getInvoiceKey = CacheHelper.getData(key: 'invoice');
  var getDate = CacheHelper.getData(key: 'dateController');
  var getNational_id = CacheHelper.getData(key: 'nationalId');
  var getJob = CacheHelper.getData(key: 'job');
  var getImage1 = CacheHelper.getData(key: 'image1');
  var getWorkLocation = CacheHelper.getData(key: 'whereIsWork');
  var getNumberOfYears = CacheHelper.getData(key: 'numberOfYears');
  var getnameFamily = CacheHelper.getData(key: 'nameFamily');
  var getageFamily = CacheHelper.getData(key: 'ageFamily');
  var getgenderFamily = CacheHelper.getData(key: 'genderFamily');
  var getnationalFamily = CacheHelper.getData(key: 'nationalFamilyId');

  if(value.data!.status == 'success') {



  submitFormData(

full_name: getFullName,
    invoices_key: getInvoiceKey,
    address: address,
    date_of_birth: getDate,
    national_id: getNational_id,
    phone_number: phone,
    job: getJob,
      card_type: card_type,
    image: File(getImage1),
      email: email,
      work_location : getWorkLocation,
      numberOfYears : getNumberOfYears,

  );
print('yaaraaab');
}}).then((value) => {

  emit(GetCardSuccessStateFinish()),

});


 }


void submitFormData(
  {
    required String full_name,
    required String invoices_key,

    required  String address,
    required String date_of_birth,
    required String national_id,
    required String phone_number,
    required  String job,
    required String card_type,
    required File image,


    required String email,
    required String work_location,
    required String numberOfYears,


}
    ) async {

var dio = Dio();

// Create FormData
var formData = FormData();

// Add text fields
formData.fields.addAll([
MapEntry('full_name', full_name),
MapEntry('address', address),
MapEntry('date_of_birth', date_of_birth),
MapEntry('invoices_key', invoices_key),
MapEntry('national_id', national_id),
MapEntry('phone_number', phone_number),
MapEntry('job', job),
MapEntry('card_type', card_type),
MapEntry('email', email),

MapEntry('work_location', work_location),
MapEntry('numberOfYears', numberOfYears),

],




);
  String filename = image.path.split('/').last;

if (image != null) {
formData.files.add(
    MapEntry(
'image',
await MultipartFile.fromFile(
    image.path, filename: filename),
));
}

  if(card_type == 'للاسره' && familyDataList.isNotEmpty)
  {
    for (int i = 0; i < familyDataList.length; i++) {
      Map<String, dynamic> member = familyDataList[i];

      formData.fields.add(MapEntry('family_members[$i][name]', member['name']));
      formData.fields.add(MapEntry('family_members[$i][age]', member['age'].toString()));
      formData.fields.add(MapEntry('family_members[$i][national_id]', member['national_id'].toString()));
      formData.fields.add(MapEntry('family_members[$i][gender]', member['gender']));

      // Add the image file if available
      if (member['image'] != null) {
        formData.files.add(
          MapEntry(
            'family_members_images[$i]',
            await MultipartFile.fromFile(member['image']),
          ),
        );
      }
    }


  } else
  {
    formData.fields.add(
      MapEntry('family_members', '[]'),
    );
  }

try {

var response = await dio.post(
'https://api.nmc.com.eg/public/api/bookings',
data: formData,
    options: Options(
       followRedirects: false,
       validateStatus :
        (status) => status != null &&  status < 400,
        maxRedirects : 0,
        headers: {
          'Accept': '*/*',
          'Content-Type': 'multipart/form-data',
        }
    ),

);

emit(GetCardSuccessStateFinish());
print('yes');
if (response.statusCode == 201) {
 await getCard(phone: phone_number);
  print('there is phone $phone_number');


  emit(GetCardSuccessStateFinishDesign());
print("Success: ${response.data}");
} else {
print("ErrorWhenTry: ${response.statusMessage} ${response.statusCode}");
}
} catch (error) {
print("CatchError: $error");
}
}
//
//  postCard ({
//
//    required String? full_name,
//    required String? invoices_key,
//
//    required  String? address,
//    required String? date_of_birth,
//    required String? national_id,
//    required String? phone_number,
//    required  String? job,
//    required String? card_type,
//    required String image,
//
//
//    required String? email,
//    required String? work_location,
//    required String? numberOfYears,
//
// }) async
//  {
//
//    await cardRepo.bookingCard(Card(
//
// full_name: full_name,
//      address: address,
//      invoices_key: invoices_key,
//      email: email,
//      image: File(image),
//
//      date_of_birth: date_of_birth,
//      job: job,
//      phone_number: phone_number,
//      national_id: national_id,
//      work_location: work_location,
//      card_type: card_type,
//      numberOfYears: numberOfYears,
//
//    )).then((value) => {
//      showToast(text: value.message.toString(), state: ToastStates.success),
//      emit(PostSuccessCardState()),
//
//      getCard(phone: phone_number.toString() ),
//    }).catchError((error) {
//
//      showToast(text: 'حدث خطأ في البيانات', state: ToastStates.error);
//
//      emit( PostErrorCardState());
//    });
//  }


CardM? cardDetails ;
List<FamilyMembers>? family ;
getCard({required String phone}) async
{
  await cardRepo.getCardAfter(phone).then((value) {
   cardDetails = value.card;

   family = value.family_members;
     CacheHelper.saveData(key: 'state', value: value.card!.state);
print(value.card!.state);
print('value.card!.state');

    emit(GetCardSuccessState());
  });
}
}

