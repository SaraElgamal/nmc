import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/features/ui/widgets/homePge.dart';


import 'modules_nav/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationControllerNMC;
  late Animation<double> _animation1;
  late Animation<double> _animationNmc;

  @override
  void initState() {

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationControllerNMC = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation1 = Tween<double>(begin: 300.0, end: 1.0).animate(_animationController)
      ..addStatusListener((state) {


      })..addListener(() {

        setState(() {

        });

      });
    _animationNmc = Tween<double>
      (begin: 350.0, end: 1.0).
    animate(_animationControllerNMC)
      ..addStatusListener((state) { })
      ..addListener(() {

        setState(() {

        });

      });


    _animationController.forward();
    _animationControllerNMC.forward();

    Future.delayed(const Duration(seconds: 4),(){
      navigateFinish(context, const  HomePage());
    });
    super.initState();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(


          animation: _animationControllerNMC,
          builder: (BuildContext context, Widget? child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                 Row(

                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [

                   Transform.translate(

                     offset: Offset(
                   // MediaQuery.of(context).size.width * (1 -
                        _animationNmc.value
                   // )
                         ,
                         0.0
                     ),
                     child:

                     SvgPicture.asset(
                         'assets/images/nmc.svg'),

                   ),
                  SizedBox(width: 24.w,),
                   Transform.translate(
                     offset: Offset(
                      - _animation1.value,
                       0.0,
                     ),
                     child:

                     SvgPicture.asset('assets/images/splash.svg'),



                   ),
                     SizedBox(width: 16.w,),
                 ],),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}