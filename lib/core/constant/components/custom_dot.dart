import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDot extends StatelessWidget {
  final int currentIndex;
  final int index;
  final Color color;
  const CustomDot(
      {super.key,
        required this.currentIndex,
        required this.index,
        required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 6.w,
      margin:  EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20.r),
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
