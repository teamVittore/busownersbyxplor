import 'package:admin_app/UI/components/textfield/text_feild_component.dart';
import 'package:admin_app/core/utils/formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUpiPage extends StatefulWidget {
  const AddUpiPage({super.key});

  @override
  State<AddUpiPage> createState() => _AddUpiPageState();
}

class _AddUpiPageState extends State<AddUpiPage> {
  final TextEditingController upiController = TextEditingController();
  bool isValidUpi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF4E0BBB),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Add payment method',
          style: TextStyle(
            color: const Color(0xFF273648),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Enter your UPI details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0B1323),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing you agree to our ',
                        style: TextStyle(
                          color: const Color(0xFF797B80),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          color: const Color(0xFF4E0BBB),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UPI ID',
                      style: TextStyle(
                        color: const Color(0xFF8D9EB2),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFieldComponent(
                            inputFormatters: [UpiIdFormatter()],
                            // textInputType: TextInputType.text,
                            controller: upiController,
                            hintText: "sahal123@oksbi",
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            validateUpi(upiController.text);
                          },
                          child: Container(
                            width: 88.w,
                            height: 44.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF4E0BBB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r)),
                            ),
                            child: Center(
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                isValidUpi
                    ? Row(
                        children: [
                          Opacity(
                            opacity: 0.70,
                            child: Text(
                              'UPI ID verified successfully',
                              style: TextStyle(
                                color: const Color(0xFF13A579),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Icon(
                            Icons.check_circle_sharp,
                            size: 12.dm,
                            color: const Color(0xFF13A579),
                          ),
                        ],
                      )
                    : Opacity(
                        opacity: 0.70,
                        child: Text(
                          'The UPI ID is in the format of name/phone number\n@bankname',
                          style: TextStyle(
                            color: const Color(0xFF999999),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16.h,
              ),
              child: Container(
                width: 312.w,
                height: 48.h,
                decoration: ShapeDecoration(
                  color: isValidUpi
                      ? const Color(0xFF4E0BBB)
                      : const Color(0xFFAC90F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Add now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFF8FAFC),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void validateUpi(String value) {
    setState(() {
      isValidUpi = RegExp(r'^[\w.-]+@[\w.-]+$').hasMatch(value);
    });
  }
}
