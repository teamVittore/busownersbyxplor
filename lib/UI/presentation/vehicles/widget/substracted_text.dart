import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtractText extends StatelessWidget {
  final String input;

  const SubtractText({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    String beforeLastSpace = getBeforeLastSpace(input);
    String afterLastSpace = getAfterLastSpace(input);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: beforeLastSpace,
            style: TextStyle(
              color: const Color(0xFF334155),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: afterLastSpace,
            style: TextStyle(
              color: const Color(0xFF5475FA),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String getAfterLastSpace(String input) {
    int lastSpaceIndex = input.lastIndexOf(' ');

    if (lastSpaceIndex == -1) {
      // No spaces found in the input string
      return '';
    }

    return input.substring(lastSpaceIndex + 1);
  }

  String getBeforeLastSpace(String input) {
    int lastSpaceIndex = input.lastIndexOf(' ');

    if (lastSpaceIndex == -1) {
      // No spaces found in the input string
      return input;
    }

    return input.substring(0, lastSpaceIndex + 1);
  }
}
