import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiveExpenseTile extends StatelessWidget {
  const LiveExpenseTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 100.w,
            height: 32.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFE9DDFC),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/cash.svg"),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  '₹8,000',
                  style: TextStyle(
                    color: const Color(0xFF4E0BBB),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100.w,
            height: 32.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFFBE5E6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/cash.svg",
                  color: const Color(0xFFDE1C22),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  '₹8,000',
                  style: TextStyle(
                    color: const Color(0xFFDE1C22),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                SvgPicture.asset(
                  "assets/icons/down.svg",
                  color: const Color(0xFFDE1C22),
                ),
              ],
            ),
          ),
          Container(
            width: 100.w,
            height: 32.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFE0FBE9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/cash.svg",
                  color: const Color(0xFF13A579),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  '₹8,000',
                  style: TextStyle(
                    color: const Color(0xFF13A579),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                SvgPicture.asset(
                  "assets/icons/up.svg",
                  color: const Color(0xFF13A579),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
