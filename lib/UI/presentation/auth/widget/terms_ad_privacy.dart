import 'package:admin_app/core/theme/textstyle_theme.dart';
import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 16.h),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: 'By continuing, you agree to our ',
                style: text12W400(textBlckColor)),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: const Color(0xFF3871F5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                height: 1.66,
              ),
            ),
            TextSpan(text: ' and ', style: text12W400(textBlckColor)),
            TextSpan(
              text: 'Terms & Conditions ',
              style: TextStyle(
                color: const Color(0xFF3871F5),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
