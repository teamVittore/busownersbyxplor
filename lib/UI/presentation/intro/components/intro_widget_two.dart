import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroWidgetTwo extends StatefulWidget {
  final Function() onTap;
  final int index;
  const IntroWidgetTwo({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  State<IntroWidgetTwo> createState() => _IntroWidgetTwoState();
}

class _IntroWidgetTwoState extends State<IntroWidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.h,
          decoration: const BoxDecoration(color: Color(0xFFF3EDFF)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.index == 0
                        ? const SizedBox()
                        : InkWell(
                            onTap: widget.onTap,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 24.w,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child:
                                    SvgPicture.asset("assets/icons/back.svg"),
                              ),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 24.w,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/question.svg"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: SizedBox(
                        width: 110.h,
                        height: 110.h,
                        child: Image.asset("assets/images/intro_4.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: SizedBox(
                        width: 142.h,
                        height: 110.h,
                        child: Image.asset("assets/images/intro_5.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: SizedBox(
                        width: 110.h,
                        height: 110.h,
                        child: Image.asset("assets/images/intro_6.png")),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            bottom: 16.h,
            top: 16.h,
          ),
          child: Column(
            children: [
              Text(
                'We charge you a small platform fee for the following:',
                style: TextStyle(
                  color: const Color(0xFF4E0BBB),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/done.svg"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      'Accessing the Intelligent Management as a Service (IMAAS) system.',
                      style: TextStyle(
                        color: const Color(0xFF0B1323),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/done.svg"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      'Various services such as user support, system upgrades.',
                      style: TextStyle(
                        color: const Color(0xFF0B1323),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/done.svg"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      'Bug fixes, server upkeep, and routine updates to ensure the smooth operation of the platform',
                      style: TextStyle(
                        color: const Color(0xFF0B1323),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 312.w,
          height: 144.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE0CDFF)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 12.h, bottom: 12.h, left: 17.w, right: 17.w),
            child: Text(
              'We believe in transparency and aim to provide you with a clear understanding of the costs associated with our offerings. Your trust and satisfaction are paramount to us, and we hope this information clarifies the value and support you receive from our platform.',
              style: TextStyle(
                color: const Color(0xFF1E0051),
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Renewed automatically. Cancel anytime.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF797B80),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
