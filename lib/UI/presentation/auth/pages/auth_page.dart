import 'dart:async';
import 'dart:developer';

import 'package:admin_app/UI/components/textfield/text_feild_component.dart';
import 'package:admin_app/UI/presentation/auth/bloc/auth_bloc.dart';
import 'package:admin_app/UI/presentation/auth/widget/otp_filed.dart';
import 'package:admin_app/UI/presentation/auth/widget/terms_ad_privacy.dart';
import 'package:admin_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _secondsRemaining = 30;
  bool _timerActive = true;
  late Timer _timer;

  bool isButtonEnabled = false;
  bool isOtpButtonEnabled = false;
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController otpController = TextEditingController();
  MaskTextInputFormatter phoneNumberFormatter = MaskTextInputFormatter(
    mask: '##### #####', // 5 digits, space, and then 5 more digits
    filter: {"#": RegExp('[0-9]')}, // Only allow digits
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.0.w,
            top: 30.h,
            right: 24.0.w,
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if(state is AuthError){
                showToast(state.message);
              }
              if (state is OtpVerfiedState) {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const HomeScreen(),
                //   ),
                //   (route) => false,
                // );
              }
              log("State: $state");
              if (state is OtpSendedState) {
                _secondsRemaining = 30;
                _timerActive = true;
                _startTimer();
              }
              if (state.step == 4) {
                //  _startTimer();
                showToast("Otp Sended");
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is OtpSendedState ||
                      state.step == 2 ||
                      state.step == 4 ||
                      state.step == 5)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your OTP',
                            style: TextStyle(
                              color: const Color(0xFF273648),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                EditPhoneEvent(
                                  phone:
                                      phoneController.text.replaceAll(' ', ''),
                                  step: 0,
                                ),
                              );
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'We have sent a 4-digit OTP on your\nphone no',
                                    style: TextStyle(
                                      color: const Color(0xFF728492),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' ${state is OtpSendedState ? state.email : ""} ',
                                    style: TextStyle(
                                      color: const Color(0xFF273648),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'edit',
                                    style: TextStyle(
                                      color: const Color(0xFF5D7CFB),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  OtpField(otpController: otpController),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Didn't receive it ? ",
                                          //  textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF273648),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                      if (!_timerActive)
                                        InkWell(
                                          onTap: () {
                                            context.read<AuthBloc>().add(
                                                OtpSendEvent(
                                                    step: 4,
                                                    email: phoneController.text
                                                        .replaceAll(' ', '')));
                                          },
                                          child: Text(
                                            'Resend OTP',
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color(0xFF3871F5),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      else
                                        Text(
                                          'Resend in $_secondsRemaining sec',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFF273648),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (state is AuthInitial || state.step == 1)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your phone number',
                            style: TextStyle(
                              color: const Color(0xFF334155),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 64.h,
                          ),
                          TextFieldComponent(
                              inputFormatters: [phoneNumberFormatter],
                              textInputType: TextInputType.phone,
                              controller: phoneController,
                              hintText: "Enter phone number"),
                        ],
                      ),
                    ),
                  const TermsAndPrivacy(),
                  if (state is AuthLoading)
                    SizedBox(
                      width: 312.w,
                      height: 56.h,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  if (state is AuthInitial || state is AuthError)
                    GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(OtpSendEvent(
                            step: 1,
                            email: phoneController.text.replaceAll(' ', '')));
                      },
                      child: Container(
                        width: 312.w,
                        height: 56.h,
                        decoration: ShapeDecoration(
                          color: isButtonEnabled
                              ? const Color(0xFF5D7CFB)
                              : const Color(0xFFCED0D3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Get OTP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (state is OtpSendedState)
                    GestureDetector(
                      onTap: () {
                        context.read<AuthBloc>().add(OtpVerifyEvent(
                              step: 3,
                              email: phoneController.text.replaceAll(' ', ''),
                              otp: otpController.text,
                            ));
                      },
                      child: Container(
                        width: 312.w,
                        height: 56.h,
                        decoration: ShapeDecoration(
                          color: isOtpButtonEnabled
                              ? const Color(0xFF5D7CFB)
                              : const Color(0xFFCED0D3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Verify Otp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 26.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    _timer.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    phoneController.addListener(_textListener);
    otpController.addListener(_otptextListener);
  }

  void _otptextListener() {
    if (otpController.text.length == 4) {
      setState(() {
        isOtpButtonEnabled = true;
      });
    } else {
      setState(() {
        isOtpButtonEnabled = false;
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer.cancel();
        setState(() {
          _timerActive = false;
        });
      }
    });
  }

  void _textListener() {
    // Remove spaces and handle the 10-digit phone number
    final String phoneNumber = phoneController.text.replaceAll(' ', '');
    final bool isEmail = phoneNumber.length >= 10;

    if (isEmail) {
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      setState(() {
        isButtonEnabled = false;
      });
    }
  }
}
