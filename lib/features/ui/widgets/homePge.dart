
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n_m_c/core/constant/const/const.dart';

import 'modules_nav/home_screen.dart';
import 'modules_nav/medical_card.dart';
import 'modules_nav/medical_network.dart';
import 'modules_nav/registration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List Screens = [
    const HomeScreen(),
    const MedicalNetwork(),
    Registration(),
  ];
  int _selectedIndex =0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
height: 72.h,
        buttonBackgroundColor: primaryColor,
        animationCurve: Curves.easeIn,
        index:  _selectedIndex,
        color: primaryColor,
        backgroundColor: Colors.white,

        items:  [


          SvgPicture.asset('assets/images/home.svg',
            height: 30.h,
            width: 30.w,
          //  color:  _selectedIndex == 0 ? Colors.white : primaryColor,
          color: Colors.white,
          ),

          SvgPicture.asset('assets/images/world-solid.svg',

            height: 30.h,
            width: 30.w,
         // color:  _selectedIndex == 1 ? Colors.white : primaryColor,
            color: Colors.white,
          ),

          SvgPicture.asset('assets/images/people.svg',
         //   color:  _selectedIndex == 2 ? Colors.white : primaryColor,
            height: 30.h,
            width: 30.w,
            color: Colors.white,
          ),


        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;

          });
        },
      ),
      body:  Screens[_selectedIndex],


    );
  }
}