import 'package:admin_app/UI/presentation/intro/components/intro_widget_two.dart';
import 'package:admin_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var introList = [
    "assets/images/intro_1.png",
    "assets/images/intro_2.png",
    "assets/images/intro_3.png",
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            index != 3
                ? Column(
                    children: [
                      Container(
                        height: 420.h,
                        decoration:
                            const BoxDecoration(color: Color(0xFFF3EDFF)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  index == 0
                                      ? const SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              index--;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 24.w,
                                            ),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: SvgPicture.asset(
                                                  "assets/icons/back.svg"),
                                            ),
                                          ),
                                        ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 24.w,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                          "assets/icons/question.svg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              'Xplor',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF4E0BBB),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                                top: index == 0 ? 67.h : 0,
                              ),
                              child: Image.asset(introList[index]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 12.h,
                            height: 12.h,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: OvalBorder(),
                            ),
                            child: index == 0
                                ? Center(
                                    child: Container(
                                      width: 8.h,
                                      height: 8.h,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF4E0BBB),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            width: 12.h,
                            height: 12.h,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: OvalBorder(),
                            ),
                            child: index == 1
                                ? Center(
                                    child: Container(
                                      width: 8.h,
                                      height: 8.h,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF4E0BBB),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            width: 12.h,
                            height: 12.h,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: OvalBorder(),
                            ),
                            child: index == 2
                                ? Center(
                                    child: Container(
                                      width: 8.h,
                                      height: 8.h,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF4E0BBB),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Text(
                        index == 0
                            ? "Track your work and get results"
                            : index == 1
                                ? 'Aim for the clouds'
                                : "Get daily reports",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF273648),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        index == 0
                            ? "Manage all of your fleet effortlessly at your fingertips"
                            : index == 1
                                ? 'Simplify bus operations. Achieve ambitious targets, effortlessly'
                                : "Track daily profit and revenue easily",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF0B1323),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                : IntroWidgetTwo(
                    index: index,
                    onTap: () {
                      setState(() {
                        index--;
                      });
                    },
                  ),
            InkWell(
              onTap: () {
                if (index == 3) {
                  context.goNamed(Routes.payment.name);
                } else {
                  setState(() {
                    index++;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Container(
                  width: 312.w,
                  height: 48.h,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4E0BBB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      index == 3 ? 'Add payment method' : 'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFF8FAFC),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
