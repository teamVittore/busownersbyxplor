import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingIndicator extends StatelessWidget {
  final bool isActive;

  const OnBoardingIndicator({
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.r,
      width: isActive ? 48.r : 8.r,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : const Color(0xff8D9DB1),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
