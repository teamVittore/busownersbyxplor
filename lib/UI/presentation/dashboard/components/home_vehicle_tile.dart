import 'package:admin_app/UI/presentation/vehicles/widget/substracted_text.dart';
import 'package:admin_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeVehicleTile extends StatelessWidget {
  const HomeVehicleTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.vehicleDetails.name);
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 12.h,
              top: 12.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubtractText(input: "KL 01 DY 1234"),
                Row(
                  children: [
                    Text(
                      '₹436',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF181818),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      width: 16.h,
                      height: 16.h,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF3ECFE),
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 10.sp,
                          color: const Color(0xFF833AF6),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: const Color(0xFFDEDDDD),
            width: 290.w,
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
