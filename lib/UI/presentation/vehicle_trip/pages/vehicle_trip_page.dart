import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehicleTripPage extends StatelessWidget {
  final String name;
  const VehicleTripPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            color: const Color(0xFF0B1323),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.0.h),
              child: Container(
                width: 328.w,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 1.w, color: const Color(0xFFE5EBF3)),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 14.h,
                    bottom: 14.h,
                    right: 20.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trip No',
                                style: TextStyle(
                                  color: const Color(0xFF6B778C),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '001',
                                style: TextStyle(
                                  color: const Color(0xFF334155),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: const Color(0xFFE5EBF3),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFE5EBF3)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.0.w,
                                right: 8.w,
                                bottom: 4.h,
                                top: 4.h,
                              ),
                              child: Center(
                                child: Text(
                                  'Revenue: ₹436',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF334155),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        width: 288.w,
                        height: 1.h,
                        decoration:
                            const BoxDecoration(color: Color(0xFFE5EBF3)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Start time',
                                style: TextStyle(
                                  color: const Color(0xFF6B778C),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '8:30 am',
                                style: TextStyle(
                                  color: const Color(0xFF334155),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'End time',
                                style: TextStyle(
                                  color: const Color(0xFF6B778C),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '8:30 am',
                                style: TextStyle(
                                  color: const Color(0xFF334155),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
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
