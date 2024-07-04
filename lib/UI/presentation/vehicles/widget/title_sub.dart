import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleSub extends StatelessWidget {
  final String title;
  final String sub;
  final String? richText;
  final bool isRichText;
  const TitleSub(
      {super.key,
      required this.title,
      required this.sub,
      this.isRichText = false,
      this.richText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              color: const Color(0xFF6B778C),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            )),
        if (isRichText)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: sub,
                  style: TextStyle(
                    color: const Color(0xFF334155),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: richText,
                  style: TextStyle(
                    color: const Color(0xFF5D7CFB),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        else
          Text(
            sub,
            style: TextStyle(
              color: const Color(0xFF334155),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          )
      ],
    );
  }
}
