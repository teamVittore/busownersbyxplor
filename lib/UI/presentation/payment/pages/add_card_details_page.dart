import 'package:admin_app/UI/components/textfield/text_feild_component.dart';
import 'package:admin_app/UI/presentation/payment/cubit/auto_debit_cubit.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:admin_app/core/utils/formater.dart';
import 'package:admin_app/core/utils/toast.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardDetailsPage extends StatefulWidget {
  const AddCardDetailsPage({super.key});

  @override
  State<AddCardDetailsPage> createState() => _AddCardDetailsPageState();
}

class _AddCardDetailsPageState extends State<AddCardDetailsPage> {
  final TextEditingController cardholderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expMonthController = TextEditingController();
  final TextEditingController expYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final CreditCardValidator _ccValidator = CreditCardValidator();

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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Enter your credit card details',
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
                          'Cardholder name',
                          style: TextStyle(
                            color: const Color(0xFF8D9EB2),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFieldComponent(
                          inputFormatters: const [],
                          // textInputType: TextInputType.text,
                          controller: cardholderNameController,
                          hintText: "John Henry",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Number',
                          style: TextStyle(
                            color: const Color(0xFF8D9EB2),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFieldComponent(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                19), // For 16 digits + 3 spaces
                            CardNumberFormatter(), // Custom formatter for spacing
                          ],
                          textInputType: TextInputType.number,
                          controller: cardNumberController,
                          hintText: "**** **** **** 3947",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 146.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Exp Month',
                                style: TextStyle(
                                  color: const Color(0xFF8D9EB2),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              TextFieldComponent(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                // textInputType: TextInputType.text,
                                controller: expMonthController,
                                hintText: "12",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 146.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Exp Year',
                                style: TextStyle(
                                  color: const Color(0xFF8D9EB2),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              TextFieldComponent(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(
                                      4), // Change to 2 for "YY"
                                ],
                                // textInputType: TextInputType.text,
                                controller: expYearController,
                                hintText: "2027",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 146.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CVV',
                                style: TextStyle(
                                  color: const Color(0xFF8D9EB2),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              TextFieldComponent(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],

                                // textInputType: TextInputType.text,
                                controller: cvvController,
                                hintText: "947",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: Opacity(
                            opacity: 0.70,
                            child: Text(
                              '3 or 4 digits usually found on the signature strip',
                              style: TextStyle(
                                color: const Color(0xFF999999),
                                fontSize: 11.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                locator<AutoDebitCubit>().initatePayment();

                // showDialog(
                //   context: context,
                //   builder: (context) => Dialog(
                //     insetPadding: EdgeInsets.all(16.r),
                //     child: SizedBox(
                //       width: double.infinity,
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           SizedBox(
                //             height: 32.h,
                //           ),
                //           Container(
                //             width: 140.h,
                //             height: 140.h,
                //             decoration: const ShapeDecoration(
                //               color: Color(0xFFE4F9F0),
                //               shape: OvalBorder(),
                //             ),
                //             child: Center(
                //               child: Container(
                //                 width: 112.78.h,
                //                 height: 112.78.h,
                //                 decoration: const ShapeDecoration(
                //                   color: Color(0xFFABECD1),
                //                   shape: OvalBorder(),
                //                 ),
                //                 child: Center(
                //                   child: Container(
                //                     width: 77.78.h,
                //                     height: 77.78.h,
                //                     decoration: const ShapeDecoration(
                //                       color: Color(0xFF09A060),
                //                       shape: OvalBorder(),
                //                     ),
                //                     child: Center(
                //                       child: Icon(
                //                         Icons.done_rounded,
                //                         color: Colors.white,
                //                         size: 57.78.h,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //           SizedBox(
                //             height: 32.h,
                //           ),
                //           Text(
                //             'Card details added successfully',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               color: const Color(0xFF0B1323),
                //               fontSize: 18.sp,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //           SizedBox(
                //             height: 32.h,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 16.h,
                ),
                child: Container(
                  width: 312.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4E0BBB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF8FAFC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
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

  bool validateCreditCardInfo(
    String ccNum,
    String expDate,
    String cvv,
  ) {
    var ccNumResults = _ccValidator.validateCCNum(ccNum);
    var expDateResults = _ccValidator.validateExpDate(expDate);
    var cvvResults = _ccValidator.validateCVV(cvv, ccNumResults.ccType);

    if (ccNumResults.isPotentiallyValid) {
      showToast("Card Number is not valid");
      return false;
      // displayInvalidCardNumber();
    } else if (expDateResults.isPotentiallyValid) {
      showToast("Expire Date is not valid");
      return false;
    } else if (cvvResults.isPotentiallyValid) {
      showToast("CVV Number is not valid");
      return false;
    } else {
      return true;
    }
  }
}
