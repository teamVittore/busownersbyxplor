import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MethodTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String description;
  final String image;
  const MethodTile({
    super.key,
    required this.isSelected,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 64,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: !isSelected
              ? const BorderSide(width: 1, color: Color(0xFFF2F3F7))
              : const BorderSide(width: 1, color: Color(0xFF4E0BBB)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 8.h,
          left: 8.w,
          right: 8.w,
          top: 8.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/icons/$image.png"),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF0B1323),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: const Color(0xFF797B80),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Icon(
              !isSelected
                  ? Icons.add_circle_outline_rounded
                  : Icons.check_circle_rounded,
              color: const Color(0xFF4E0BBB),
            ),
          ],
        ),
      ),
    );
  }
}
