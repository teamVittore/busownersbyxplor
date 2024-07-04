import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RunningLateBox extends StatelessWidget {
  const RunningLateBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 24.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFFBF1DA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF9EAC7)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: const Center(
          child: Text(
        'Running Late',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 11,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0.13,
        ),
      )),
    );
  }
}
