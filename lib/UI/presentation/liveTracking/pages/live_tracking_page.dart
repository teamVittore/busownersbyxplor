import 'package:admin_app/UI/components/ontime_box.dart';
import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiveTrackingPage extends StatelessWidget {
  const LiveTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Live Tracking",
          style: TextStyle(
            color: const Color(0xFF0B1323),
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'KL 01 AB ',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: '0022',
                  style: TextStyle(
                    color: Color(0xFF5475FA),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          const OnTimeBox(),
          SizedBox(
            width: 12.w,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: secondaryGrayTwo,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 32.h,
            ),
            child: const Column(
              children: [
                LocationTile(
                  type: 1,
                ),
                LocationTile(
                  type: 2,
                ),
                LocationTile(
                  type: 3,
                ),
                LocationTile(
                  type: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LocationTile extends StatelessWidget {
  final int type;
  const LocationTile({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: type == 2 ? 29.w : 34.0.w,
          ),
          child: Column(
            children: [
              if (type == 2)
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: const Color(0xFFF3F6FC),
                  child: SvgPicture.asset(
                    "assets/icons/bus.svg",
                    height: 18,
                    width: 18,
                  ),
                ),
              if (type == 1)
                const Icon(
                  Icons.gps_fixed,
                  color: Color(0xFFD3D5E2),
                ),
              if (type == 3)
                const Icon(
                  Icons.circle_sharp,
                  color: Colors.black,
                ),
              Container(
                height: 45.h,
                width: 2.w,
                color: type == 1
                    ? const Color(0xFFD3D5E2)
                    : const Color(0xFF5979FB),
              )
            ],
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kochi airport',
              style: TextStyle(
                color: const Color(0xFF6B778C),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '8:30 am',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )
      ],
    );
  }
}
