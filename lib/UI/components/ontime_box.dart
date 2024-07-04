import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnTimeBox extends StatelessWidget {
  const OnTimeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62.w,
      height: 24.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFDFFAE8),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFC2D4C8)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Center(
        child: Text(
          'On Time',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF334155),
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            height: 0.13,
          ),
        ),
      ),
    );
  }
}
