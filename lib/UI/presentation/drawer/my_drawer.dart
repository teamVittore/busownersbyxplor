import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  const DrawerTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 43.w),
        Text(
          title,
          style: TextStyle(
            color: const Color(0xFF334155),
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: const Color(0xFFF9F9F9),
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 27.w),
            child: Row(children: [
              Container(
                width: 10,
                height: 10,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: const Color(0xFF8D9EB2),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 10,
                height: 10,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: const Color(0xFF8D9EB2),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 10,
                height: 10,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: const Color(0xFF8D9EB2),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ]),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 32.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  color: const Color(0xFFEEF0F5),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 24.h,
                ),
                const DrawerTile(title: "My Profile"),
                SizedBox(
                  height: 16.h,
                ),
                const DrawerTile(title: "Security"),
                SizedBox(
                  height: 16.h,
                ),
                const DrawerTile(title: "Privacy & policy"),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 34.w,
              ),
              const Icon(
                Icons.logout,
                color: Color(0xFFE11D48),
              ),
              SizedBox(
                width: 7.w,
              ),
              const Text(
                'Logout ',
                style: TextStyle(
                  color: Color(0xFFE11D48),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 32.h,
          ),

          // Add more list items as needed
        ],
      ),
    );
  }
}
