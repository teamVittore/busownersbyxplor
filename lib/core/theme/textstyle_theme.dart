import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle text20w700 = TextStyle(
  color: textBlckColor,
  fontSize: 20.sp,
  fontWeight: FontWeight.w700,
);
TextStyle buttonStyle(
  Color color,
) =>
    TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
TextStyle text12W400(Color color, {FontWeight? fontWeight}) => TextStyle(
      color: color,
      fontSize: 12.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );

TextStyle text14w400(Color color, {FontWeight? fontWeight}) => TextStyle(
      color: color,
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
