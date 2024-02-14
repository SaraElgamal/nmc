

import 'package:flutter/cupertino.dart';

class SliderRight extends PageRouteBuilder
{
  final page;
  SliderRight({this.page}) : super(
      pageBuilder: (context , animation , animationTwo ) => page
      ,transitionsBuilder: (context , animation , animationTwo, child ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset(0.0, 0.0);
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
  );

}
class SliderLeft extends PageRouteBuilder
{
  final page;
  SliderLeft({this.page}) : super(
      pageBuilder: (context , animation , animationTwo ) => page
      ,transitionsBuilder: (context , animation , animationTwo, child ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset(0.0, 0.0);
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
  );

}

// class BottomBar extends PageRouteBuilder
// {
//   final page;
//   SliderRight({this.page}) : super(
//       pageBuilder: (context , animation , animationTwo ) => page
//       ,transitionsBuilder: (context , animation , animationTwo, child ) {
//     const begin = Offset(1.0, 0.0);
//     const end = Offset(0.0, 0.0);
//     final tween = Tween(begin: begin, end: end);
//     final offsetAnimation = animation.drive(tween);
//     final curvedAnimation = CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeIn,
//     );
//     return ScaleTransition(
//       scale: curvedAnimation,
//       child: child,
//     );
//   }
//   );
//
// }