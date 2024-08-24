import 'package:admin_app/UI/presentation/payment/components/method_tile.dart';
import 'package:admin_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Add payment method',
                  style: TextStyle(
                    color: const Color(0xFF273648),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: MethodTile(
                      isSelected: index == 1,
                      title: "Credit Card",
                      description: "Link your account",
                      image: "credit_card"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: MethodTile(
                      isSelected: index == 2,
                      title: "Debit Card",
                      description: "Link your account",
                      image: "debit_card"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: MethodTile(
                      isSelected: index == 3,
                      title: "UPI payment",
                      description: "Enable contactless",
                      image: "upi"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      index = 4;
                    });
                  },
                  child: MethodTile(
                      isSelected: index == 4,
                      title: "Netbanking",
                      description: "Link your account",
                      image: "net_banking"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                // Container(
                //   width: 328.w,
                //   height: 44.h,
                //   clipBehavior: Clip.antiAlias,
                //   decoration: ShapeDecoration(
                //     color: Colors.white,
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(
                //           width: 1.w, color: const Color(0xFFF2F3F7)),
                //       borderRadius: BorderRadius.circular(8.r),
                //     ),
                //   ),
                //   child: Center(
                //     child: Text(
                //       '+ more options',
                //       style: TextStyle(
                //         color: const Color(0xFF4E0BBB),
                //         fontSize: 12.sp,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            GestureDetector(
              onTap: () {
                if (index == 1) {
                  context.pushNamed(Routes.addCard.name);
                } else if (index == 2) {
                  context.pushNamed(Routes.addCard.name);
                } else {
                  context.pushNamed(Routes.addUpi.name);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 16.h,
                ),
                child: Container(
                  width: 312.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4E0BBB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF8FAFC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
