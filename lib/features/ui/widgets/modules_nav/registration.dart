
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:n_m_c/features/logic/cubit/states.dart';
import 'package:n_m_c/features/payment/way_to_pay.dart';

import 'package:path_provider/path_provider.dart';
import '../../../../../core/constant/components/components.dart';
import '../../../../../core/constant/const/const.dart';
import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/login/login_presentation/login/login.dart';
import '../../../logic/cubit/cubit.dart';



List<Map<String, String>> familyDataList = [];
var nameFamily = TextEditingController();
var ageFamily = TextEditingController();
var genderFamily = TextEditingController();
var national_family_id = TextEditingController();
TextEditingController _imageController2 = TextEditingController();
TextEditingController _imageController1 = TextEditingController();

File? selectedImage1;
File? selectedImage2;
bool cardfardy = true ;



var fullName = TextEditingController();
var address = TextEditingController();

var national_id = TextEditingController();
var phone_number = TextEditingController();

var job = TextEditingController();
var email = TextEditingController(); ///
var whereIsWork = TextEditingController();
int numberOfYearsValue = 1;

Future<void> saveImageToFile(String key, File imageFile) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagePath = '${directory.path}/$key.png';

  // Save the file to local storage
  await imageFile.copy(imagePath);

  // Save the file path to shared preferences
  await CacheHelper.saveData(key: key, value: imagePath);
}
File? image1  ;
 Dio dio = Dio();
class Registration extends StatefulWidget {

  Registration({Key? key}) : super(key: key);
  static var formKeyCard = GlobalKey<FormState>();

  @override
  State<Registration> createState() => _RegistrationState();

}

class _RegistrationState extends State<Registration> {


  Future<File> loadImageFromFile(String key) async {
    final String? imagePath = CacheHelper.getData(key: key);
    if (imagePath != null) {
      return File(imagePath);
    }
    return File(''); // You can return a default file or handle it based on your needs
  }
  File? _image;
  Future getImage() async {
    var image;

    image =
    await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });



  }





///


  Future<void> _pickImage1(bool isCamera) async {
    final pickedFile;
   isCamera ?
       pickedFile = await ImagePicker.platform.getImageFromSource(
          source: ImageSource.camera)
    :
       pickedFile = await ImagePicker.platform.getImageFromSource(
          source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage1 = File(pickedFile.path);
        _imageController1.text = pickedFile.name;
      });
    }
  }
  Future<void> _pickImage2(bool isCamera) async {
    final pickedFile;
    isCamera ?
    pickedFile = await ImagePicker.platform.getImageFromSource(
        source: ImageSource.camera)
        :
    pickedFile = await ImagePicker.platform.getImageFromSource(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage2 = File(pickedFile.path);
        _imageController2.text = pickedFile.name;
      });
    }
  }
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }
  late Timer _timer;

  String? nameReg = CacheHelper.getData(key: 'nameLogIn') ?? '';
// @override
//   void initState() {
//
//     super.initState();
//   }
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
// @override
//   void dispose() {
//   _timer.cancel();
//
//     super.dispose();
//   }
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarDefaultTheme(context: context,

            title:  S.of(context).register_card,
          ),
          body:

        Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: Registration.formKeyCard,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocConsumer<AppCubit,AppStates>(
                        listener: (context, state) {},
                        builder:(context, state) =>  Row(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: ()
                                {
                                  cubit.isSelected = false;
                                  cubit.isSelect();
                                setState(() {
                                  cardfardy = true ;
                                });
                                },


                              color: cubit.isSelected ? fillRectangular : primaryColor,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,

                                ),
                                child: Text(S.of(context).Individual, style: GoogleFonts.tajawal(

                                  fontSize: 16.sp,

                                  color: cubit.isSelected ? primaryColor :  Colors.white,
                                ),),
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: MaterialButton(onPressed: ()
                              {
                                cubit.isSelected = true;
                                cubit.isSelect();
                            setState(() {
                              cardfardy = false ;

                            });
                              },
                                color: cubit.isSelected ? primaryColor : fillRectangular,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,

                                ),
                                child: Text(S.of(context).For_the_family, style: GoogleFonts.tajawal(

                                fontSize: 16.sp,

                                color: cubit.isSelected ?  Colors.white : primaryColor,
                              ),
                                ),
                                ),
                            ),
                          ],
                        ),
                      ),
SizedBox(height: 24.h,),
                      Text(S.of(context).personInformation,style: GoogleFonts.tajawal(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 24.h,),
                      defaultTextFormFeild(
                        context,

                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: fullName,
                        label: S.of(context).FullName,
                        // hint: 'الاسم الاول',
                        keyboardType: TextInputType.name,
                        suffix: Container(),

                      ),
                      SizedBox(height: 24.h),
                      defaultTextFormFeild(
                        context,

                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: address,
                        label: S.of(context).address,
                        // hint: 'الاسم الثاني',
                        keyboardType: TextInputType.text,
                        suffix: Container(),

                      ),
                      SizedBox(height: 24.h),

                      defaultTextFormFeild(

                        context,
                        suffix: Container(),
                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: national_id,
                        label: S.of(context).National_ID_numbe,
                        // hint: 'البريد الالكتروني',
                        keyboardType: TextInputType.number,

                      ),
                      SizedBox(height: 24.h),
                  defaultTextFormFeild(
                    context,

                    suffix: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          numberOfYearsValue++;
                        });
                      },
                    ),
                    prefix: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (numberOfYearsValue > 1) {
                          setState(() {
                            numberOfYearsValue--;
                          });
                        }
                      },
                    ),
                    validate: (value) {
                      if (value == null || value == '') {
                        return S.of(context).validation;
                      }
                    },
                    controller: TextEditingController(text: numberOfYearsValue.toString()),
                    label: S.of(context).number_of_year,
                    keyboardType: TextInputType.number,
                  ),

                      SizedBox(height: 24.h),

                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _dateController,
                            decoration:  InputDecoration(
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 13, horizontal: 12),

                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                              labelText: S.of(context).Date_of_birth,
                              suffixIcon: const Icon(Icons.calendar_today,),
                            ),
                          ),
                        ),
                      ),


                      SizedBox(height: 24.h),

                      GestureDetector(
                        onTap: ()
                        {
                          showBottomSheet(

                            context: context,
                            builder: (context) => Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor,
                                    spreadRadius: 3,
                                  ),
                                ],
                                color: Colors.white,

                                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),),
                              ),

                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 60.w,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor, ),
                                      child: IconButton(
                                        onPressed : (){
                                         _pickImage1(true);
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.w,),
                                    Container(
                                      height: 60.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor, ),
                                      child: IconButton(
                                        onPressed : (){
                                          _pickImage1(false);
                                        },
                                        icon: const Icon(
                                          Icons.photo,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),);
                        },

                        child: AbsorbPointer(
                          child: TextField(
                            controller: _imageController1,
                            decoration:  InputDecoration(
                              contentPadding:
                            const   EdgeInsets.symmetric(vertical: 13, horizontal: 12),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),

                              labelText: S.of(context).addPhoto,
                              suffixIcon: const Icon(Icons.image),
                            ),
                          ),
                        ),
                      ),
                     const SizedBox(height: 20),
                      selectedImage1 != null
                          ? Image.file(
                        width: double.infinity,
                        selectedImage1!,
                        height: 200,
                      )
                          : Container(),
                      SizedBox(height: 24.h,),
                      Text(S.of(context).Contact_information,style: GoogleFonts.tajawal(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 24.h),
                      defaultTextFormFeild(
                        context,
                        suffix: Container(),
                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: job,
                        label: S.of(context).job,

                        // hint: 'البريد الالكتروني',
                        keyboardType: TextInputType.text,

                      ),
                      SizedBox(height: 24.h),

                      defaultTextFormFeild(
                        context,
                        suffix: Container(),
                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: phone_number,
                        label: S.of(context).home_phone_number,

                        // hint: 'البريد الالكتروني',
                        keyboardType: TextInputType.phone,

                      ),
                      SizedBox(height: 24.h),

                      defaultTextFormFeild(
                        context,
                        suffix: Container(),
                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: email,
                        label: S.of(context).email,

                        // hint: 'البريد الالكتروني',
                        keyboardType: TextInputType.emailAddress,

                      ),
                      SizedBox(height: 24.h),

                      defaultTextFormFeild(
                        context,
                        suffix: Container(),
                        validate:  (value)
                        {
                          if (value == null || value == '') {
                            return S.of(context).validation;
                          }
                        },
                        controller: whereIsWork,
                        label: S.of(context).Place_of_employment,

                        // hint: 'البريد الالكتروني',
                        keyboardType: TextInputType.text,

                      ),
                     cubit.isSelected ? familyBuilder() :
                      SizedBox(height: 80.h),
                      defaultButton(context: context,
                          text: S.of(context).Submission,
                          toPage: () {
                        if(Registration.formKeyCard.currentState!.validate()) {
    setState(() {
    CacheHelper.saveData(key: 'fullName', value: fullName.text);
    CacheHelper.saveData(key: 'address', value: address.text);
    CacheHelper.saveData(key: 'nationalId', value: national_id.text);
    CacheHelper.saveData(key: 'phoneNumber', value: phone_number.text);
    CacheHelper.saveData(key: 'numberOfYears', value: TextEditingController(text: numberOfYearsValue.toString()).text);
    CacheHelper.saveData(key: 'job', value: job.text);
    CacheHelper.saveData(key: 'email', value: email.text);
    CacheHelper.saveData(key: 'whereIsWork', value: whereIsWork.text);
    CacheHelper.saveData(key: 'dateController', value: _dateController.text);


    if (selectedImage1 != null) {
    saveImageToFile('image1', selectedImage1!);
    }
    if (nameFamily.text.isNotEmpty &&
    ageFamily.text.isNotEmpty &&
    genderFamily.text.isNotEmpty &&
    national_family_id.text.isNotEmpty) {
    // Save family data in shared preferences
    /// //////////////////////////////////////////
    for(int a = 0 ; a < familyDataList.length ; a++) {


    CacheHelper.saveData(key: 'nameFamily', value: nameFamily.text);
    CacheHelper.saveData(key: 'ageFamily', value: ageFamily.text);
    CacheHelper.saveData(key: 'genderFamily', value: genderFamily.text);
    CacheHelper.saveData(key: 'nationalFamilyId', value: national_family_id.text);

    // Save family image file path to shared preferences
    if (selectedImage2 != null) {
    if (familyDataList[a]['image'] != null) {
    saveImageToFile('image2_$a',
    File(familyDataList[a]['image']!));
    }
    saveImageToFile('image2', selectedImage2!);
    }
    }
    /// ///////////////////////////////////////////////////////////////////////////////////////////
    }

    });
if(cubit.isSelected) {
  setState(() {
    familyDataList.add({
      'name': nameFamily.text,
      'age': ageFamily.text,
      'national_id': national_family_id.text,
      'gender': genderFamily.text,
      'image': selectedImage2!.path != null ? selectedImage2!.path : '',
    });
    clearFamilyTextControllers();
  });
  setState(() {});
}
    if(nameReg == null || nameReg == '') {

    showLoginDialog();
    } else {
      navigateFinish(context,
    const WayToPay()) ;
    }

    }}



                        ),

                      SizedBox(height: 84.h),



                    ],
                  ),
                ),
              ),

          ),
       )
   );
  }

void showLoginDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Icon(Icons.warning, color: Colors.red),
        content:  Text(S.of(context).dialog,style: GoogleFonts.tajawal(fontSize: 16.sp ,),),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.pop(context);

              // Navigate to the login screen
              navigateTo(context, LogInPage());
            },
            child: const Text('ok'),
          ),
        ],
      );
    },
  );
}


  void clearFamilyTextControllers() {
    nameFamily.clear();
    ageFamily.clear();
    national_family_id.clear();
    genderFamily.clear();
    _imageController2.clear();
    selectedImage2 = null;
  }


  final FocusNode _nameFamilyFocus = FocusNode();
  Widget familyBuilder () =>
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 24.h,),
      Text(S.of(context).IndividualData,style: GoogleFonts.tajawal(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),),
      SizedBox(height: 24.h),

      defaultTextFormFeild(

        context,
        focusNode: _nameFamilyFocus,
        suffix: Container(),
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },

        controller: nameFamily,
        label: S.of(context).name,

        // hint: 'البريد الالكتروني',
        keyboardType: TextInputType.text,

      ),
      SizedBox(height: 24.h),

      defaultTextFormFeild(
        context,
        suffix: Container(),
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        controller: ageFamily,
        label: S.of(context).age,

        // hint: 'البريد الالكتروني',
        keyboardType: TextInputType.number,

      ),
      SizedBox(height: 24.h),

      defaultTextFormFeild(
        context,
        suffix: Container(),
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        controller: national_family_id,
        label: S.of(context).National_ID_numbe,

        // hint: 'البريد الالكتروني',
        keyboardType: TextInputType.number,

      ),
      SizedBox(height: 24.h),

      defaultTextFormFeild(
        context,
        suffix: Container(),
        validate:  (value)
        {
          if (value == null || value == '') {
            return S.of(context).validation;
          }
        },
        controller: genderFamily,
        label: S.of(context).Gender,

        // hint: 'البريد الالكتروني',
        keyboardType: TextInputType.text,

      ),
      SizedBox(height: 24.h),

      GestureDetector(
        onTap: (){
  showBottomSheet(
  context: context,
  builder: (context) => Container(
  width: double.infinity,
  decoration: const BoxDecoration(
  boxShadow: [
  BoxShadow(
  color: primaryColor,
  spreadRadius: 3,
  ),
  ],
  color: Colors.white,

  borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),),
  ),

  height: 120,
  child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
  children: [
  Container(
  height: 60.h,
  width: 60.w,

  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  color: primaryColor, ),
  child: IconButton(
  onPressed : (){
  _pickImage2(true);
  },
  icon: const Icon(
  Icons.camera_alt_outlined,
  color: Colors.white,
  ),
  ),
  ),
  SizedBox(width: 20.w,),
  Container(
  height: 60.h,
  width: 60.w,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  color: primaryColor, ),
  child: IconButton(
  onPressed : (){
  _pickImage2(false);
  },
  icon: const Icon(
  Icons.photo,
  color: Colors.white,
  ),
  ),
  ),
  ],
  ),
  ),
  ),);
  },


        child: AbsorbPointer(
          child: TextField(
            controller: _imageController2,
            decoration:  InputDecoration(
              contentPadding:
              const   EdgeInsets.symmetric(vertical: 13, horizontal: 12),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              labelText: S.of(context).addPhoto,
              suffixIcon: const Icon(Icons.image),
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      selectedImage2 != null
          ? Image.file(
        width: double.infinity,
        selectedImage2!,
        height: 200,
      )
          : Container(),
      SizedBox(height: 10.h),
      InkWell(
        onTap: ()
        {
          // Set focus on the first text field
          FocusScope.of(context).requestFocus(_nameFamilyFocus);

          // Add new family data to the list

          // Clear text controllers


          // Force a re-build to reflect the changes
          setState(() {

            familyDataList.add({
            'name': nameFamily.text,
            'age': ageFamily.text,
            'national_id': national_family_id.text,
            'gender': genderFamily.text,
            'image': selectedImage2!.path != null ? selectedImage2!.path : '',
          });
          clearFamilyTextControllers();

          });
          setState(() {});
          },
        child: Text(S.of(context).Add_individual,

          style: GoogleFonts.tajawal(
            decoration: TextDecoration.underline,
            fontSize: 14.sp,
            color: primaryColor,
          ),),
      ),
      SizedBox(height: 80.h),
    ],
  );


}
void clearTextControllers() {
  fullName.clear();
  address.clear();
  national_id.clear();
  phone_number.clear();
  job.clear();
  email.clear();
  whereIsWork.clear();
  TextEditingController(text: numberOfYearsValue.toString()).clear();

  selectedImage1 = null;
  _imageController1.clear();
}
