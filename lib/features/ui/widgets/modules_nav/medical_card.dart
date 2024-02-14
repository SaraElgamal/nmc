import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/core/constant/const/const.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/cubit.dart';
import 'package:n_m_c/features/payment/excutePayment/card_logic/state.dart';
import 'package:n_m_c/features/ui/widgets/modules_nav/registration.dart';

import '../../../../core/data_base/cache_helper/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../logic/cubit/cubit.dart';
import '../../../logic/cubit/states.dart';
import '../../../payment/get_card_model/get_card_model.dart';

class MedicalCard extends StatefulWidget {
  const MedicalCard({Key? key}) : super(key: key);

  @override
  State<MedicalCard> createState() => _MedicalCardState();
}

class _MedicalCardState extends State<MedicalCard> {
  var getPhoneAfter = CacheHelper.getData(key: 'phoneNumber') ?? '';
  @override
  void initState() {
    if(getPhoneAfter != null || getPhoneAfter != '') {
      CardCubit.get(context).getCard(phone: getPhoneAfter);
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SafeArea(child: BlocConsumer<AppCubit,AppStates>(
    listener: (context, state) {

    },
    builder: (context, state) => Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(context: context,

        title:  S.of(context).HeaderListCart,
      ),
      body: BlocConsumer<CardCubit,CardStates>(
        listener: (context, state) {

        },
        builder: (context, state) {

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10,),

                  SizedBox(height: 10.h,),
                  BlocConsumer<CardCubit,CardStates>(
                    listener: (context, state) {

                    },
                    builder: (context, state) {
    if(state is GetCardSuccessState && CardCubit
        .get(context)
        .cardDetails != null
        // && CardCubit
        // .get(context)
        // .cardDetails!
        // .state != "الانتظار"
    ) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

               CardFlipAnimation() ,
        ],
      );
    }
   // else if(state is GetCardSuccessState && CardCubit
   //      .get(context)
   //      .cardDetails != null
   //      && CardCubit
   //          .get(context)
   //          .cardDetails!
   //          .state == "الانتظار"
   //  ) {
   //    return  Center(child: Text(
   //      textAlign: TextAlign.center,
   //      S.of(context).not_get_Cart, style: GoogleFonts.tajawal(
   //        fontSize: 20.sp,
   //        color: primaryColor,
   //        fontWeight: FontWeight.bold),),);
   //  }
    else {return Center(child: Text(
      S.of(context).no_Cart, style: GoogleFonts.tajawal(
        fontSize: 20.sp,
        color: primaryColor,
        fontWeight: FontWeight.bold),),);}
                    }
                  ),

                ],
              ),
            );
          }

      ),
    )));
  }
}
class CardFlipAnimation extends StatefulWidget {
  @override
  _CardFlipAnimationState createState() => _CardFlipAnimationState();
}

class _CardFlipAnimationState extends State<CardFlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const  Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return


      GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: AnimatedBuilder(

        animation: _animation,
        builder: (context, child) {
          return Card(
            elevation: 10,

            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.003) // Perspective
                ..rotateY(_animation.value * 3.141), // Y-axis rotation
              child: _animation.value < 0.5
                  ? StackImage(CardCubit.get(context).cardDetails!)
                  : cardfardy ?
              Image.asset('assets/images/New IDFinal02.png', height: 280, width: 200)
                  :
              StackImageBack(CardCubit.get(context).family!),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
var getImage1 = CacheHelper.getData(key: 'image1');
Widget StackImage (CardM card) => BlocConsumer<CardCubit,CardStates>(
  listener: (context, state) {

  },
  builder: (context, state) => Stack(

    children: [

      Image.asset('assets/images/NewIDFinal01.png', height: 280, width: 200),
//id
      Positioned(

          bottom: 95,

          right: 100,

          child: Text(card.id.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),)),
//photo
      Positioned(

          bottom: 145,

          right: 68,

          child:  Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(

                shape: BoxShape.circle,
            image:  DecorationImage
                (
fit: BoxFit.cover,
              image: NetworkImage(card.image_url.toString(),),),
          ) )),
//created
      Positioned(

          bottom: 75,

          right: 100,

          child: Text(card.created.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),)),
//expire
      Positioned(

          bottom: 58,

          right: 100,

          child: Text(card.expiryDate.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),)),
//name
      Positioned(

          bottom: 120,

          right: 75,

          child: Text(card.full_name.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),)),



    ],

  ),
);
Widget StackImageBack (List<FamilyMembers>? card) => BlocConsumer<CardCubit,CardStates>(
  listener: (context, state) {

  },
  builder: (context, state) =>   Stack(

    children: [

      Image.asset('assets/images/NewIDFinal03.png', height: 280, width: 200),

      Positioned.fill(
        right: 0,
        left: 105,
        top: 20,
        bottom: 0,
        child: Stack(
        children: [
       card!.length <= 3 ?  buildFamilyCard(card) :
          buildFamilyCard(card.sublist(0, 2)),
        ],
    ),
      ),
card.length >= 3 ?
      Positioned.fill(
        right: 0,
        left: 150,
        top: 90,
        bottom: 0,
        child: Stack(
          children: [
            buildFamilyCard2(card.sublist(3)),
          ],
        ),
      ) : Container(),
    ],

  ),
);
Widget buildFamilyCard (List<FamilyMembers>? card) => BlocConsumer<CardCubit,CardStates>(
listener: (context, state) {

},
builder: (context, state) =>   Transform(
  transform: Matrix4.identity(),
  child:
    ListView.builder(
    itemBuilder: (context, index) => Transform(

transform: Matrix4.identity()..scale(-1.0, 1.0),
child: Column(
children: [
Container(
    height: 50.h,
    width: 50.w,
    decoration:  BoxDecoration(

      shape: BoxShape.circle,

      image:  DecorationImage
        (
        fit: BoxFit.cover,
        image: NetworkImage(card[index].image_url.toString(),),),
    ) ),
  SizedBox(height: 10.h,),
Text(card[index].name.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),),
SizedBox(height: 10.h,),

],
),
    ),



    itemCount: card!.length,

    shrinkWrap: true,



  ),
),


);

Widget buildFamilyCard2 (List<FamilyMembers>? card) => BlocConsumer<CardCubit,CardStates>(
  listener: (context, state) {

  },
  builder: (context, state) =>   Transform(
    transform: Matrix4.identity(),
    child:
    ListView.builder(
      itemBuilder: (context, index) => Transform(

        transform: Matrix4.identity()..scale(-1.0, 1.0),
        child: Column(
          children: [
            Container(
                height: 50.h,
                width: 50.w,
                decoration:  BoxDecoration(

                  shape: BoxShape.circle,

                  image:  DecorationImage
                    (
                    fit: BoxFit.cover,
                    image: NetworkImage(card[index].image_url.toString(),),),
                ) ),
            SizedBox(height: 10.h,),
            Text(card[index].name.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),),
            SizedBox(height: 10.h,),

          ],
        ),
      ),



      itemCount: card!.length,

      shrinkWrap: true,



    ),
  ),


);




// GridView.count(
//
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// mainAxisSpacing: 0.0,
// crossAxisSpacing: 0.0,
// padding: const EdgeInsets.symmetric(vertical: 0.0),
//
// crossAxisCount: 2,
// //number of them
// reverse: false,
//
// children: List.generate(
// card!.length,
// (index) {
// return
//
//
// Column(
// children: [
// Transform(
// transform: Matrix4.identity()..scale(-1.0, 1.0),
// child: Container(
// height: 50.h,
// width: 50.w,
// decoration:  BoxDecoration(
//
// shape: BoxShape.circle,
//
// image:  DecorationImage
// (
// fit: BoxFit.cover,
// image: NetworkImage(card[index].image_url.toString(),),),
// ) ),
// ),
// SizedBox(height: 10.h,),
// Transform(
// transform: Matrix4.identity()..scale(-1.0, 1.0),
// child: Text(card[index].name.toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),)),
//
//
// ],
// );
// },
// ),
// ),