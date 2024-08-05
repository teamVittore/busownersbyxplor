import 'dart:async';

import 'package:admin_app/UI/presentation/landing/widget/onboarding_indicator.dart';
import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  static const List demoData = [
    "Track your work and get results",
    "Aim for the clouds",
    "Get daily reports",
  ];
  static const List demoData1 = [
    "Manage all of your fleet effortlessly at your fingertips",
    "Simplify bus operations. Achieve ambitious targets, effortlessly",
    "Track daily profit and revenue easily",
  ];
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/landing.png",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: Container(
                height: 270.h,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(16.w, 30.h, 16.w, 16.h),
                child: Column(
                  children: [
                    Text(
                      'Track Your Buses \nWith Ease',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      height: 44.h,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            _pageIndex = index;
                          });
                        },
                        itemCount: demoData.length,
                        controller: _pageController,
                        itemBuilder: (context, index) => Text(
                          demoData[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.57,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 28.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            demoData.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 4.w),
                              child: OnBoardingIndicator(
                                isActive: index == _pageIndex,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //     RouteConfig.authPage(context);
                      },
                      child: Container(
                        width: 280.w,
                        height: 56.h,
                        decoration: ShapeDecoration(
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ->',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }
}
