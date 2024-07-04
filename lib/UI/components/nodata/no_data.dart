import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoData extends StatelessWidget {
  final String? title;
  final String? description;
  final Function() onTap;
  const NoData({
    super.key,
    this.title,
    this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Center(
            child: Image.asset(
          "assets/images/no_data.png",
          width: 220.w,
        )),
        SizedBox(
          height: 29.h,
        ),
        Text(
          title ?? 'NO TRIPS SCHEDULED',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Text(
          description ??
              'SORRY! \nUnfortunately there are no trips scheduled for you. ',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF6B778C),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 240.w,
            height: 56.h,
            decoration: ShapeDecoration(
              color: const Color(0xFF6E50E9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                Text(
                  ' Refresh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
