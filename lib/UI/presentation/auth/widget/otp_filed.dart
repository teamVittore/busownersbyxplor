import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatelessWidget {
  final bool isError;
  final TextEditingController _otpController;

  const OtpField({
    super.key,
    required TextEditingController otpController,
    this.isError = false,
  }) : _otpController = otpController;

  @override
  Widget build(BuildContext context) {
    Color errorBordercolor = const Color(0xFFDE1C22);
    Color lightBlueColor = const Color(0xFFECF5FF);
    Color lightBlueColorGrey = const Color(0xFFF1F4F9);
    Color blueColor = const Color(0xff6E50E9);
    return Padding(
      padding: EdgeInsets.only(
        left: 0.w,
        right: 26.w,
        bottom: 20.h,
      ),
      child: PinCodeTextField(
        controller: _otpController,
        appContext: context,
        length: 4,
        autoDisposeControllers: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        enableActiveFill: true,
        textStyle: isError ? const TextStyle(color: Color(0xFFF7444E)) : null,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,

          borderRadius: BorderRadius.circular(12.r),
          fieldHeight: 56.r,
          fieldWidth: 56.r,
          inactiveBorderWidth: 0.5,
          activeBorderWidth: 0.5,
          errorBorderWidth: 0.5,
          // activeBoxShadow: [
          //   // BoxShadow(color: lightBlueColorGrey)
          // ],
          inActiveBoxShadow: [
            BoxShadow(color: isError ? errorBordercolor : lightBlueColor)
          ],
          inactiveColor: isError ? errorBordercolor : lightBlueColorGrey,
          inactiveFillColor: lightBlueColorGrey,
          errorBorderColor: errorBordercolor,
          selectedFillColor: lightBlueColor,
          activeFillColor: isError ? const Color(0xFFFDF3F4) : lightBlueColor,
          activeColor: isError ? errorBordercolor : lightBlueColorGrey,

          selectedColor: isError ? errorBordercolor : blueColor,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        onChanged: (value) {
          // Handle OTP changes (optional)
        },
        onCompleted: (value) {
          // OTP has been entered, perform your action here
          if (kDebugMode) {
            print('Entered OTP: $value');
          }
        },
      ),
    );
  }
}
