import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationTile extends StatelessWidget {
  final int type;
  final String name;
  final String description;

  const LocationTile({
    super.key,
    required this.type,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: type == 4 ? 28.w : 33.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              type == 3
                  ? const Icon(
                      Icons.circle_outlined,
                    )
                  : type == 4
                      ? Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFF3F6FC),
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.directions_bus_rounded,
                              color: const Color(0xFF4E0BBB),
                              size: 17.w,
                            ),
                          ),
                        )
                      : Icon(
                          type == 0 ? Icons.gps_fixed : Icons.circle_outlined,
                          color: const Color(0xFFE0E1E2),
                        ),
              Container(
                color: type == 3 || type == 4
                    ? const Color(0xFF4E0BBB)
                    : const Color(0xFFD3D5E2),
                width: 2.w,
                height: 45.h,
              )
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: const Color(0xFF6B778C),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
