// ignore_for_file: public_member_api_docs, sort_ructors_first
import 'package:admin_app/UI/presentation/home/model/vehicle_model.dart';
import 'package:admin_app/UI/presentation/vehicles/widget/substracted_text.dart';
import 'package:admin_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VehicleTile extends StatelessWidget {
  final VehicleModel vehicleModel;
  final bool isRunningLate;
  const VehicleTile({
    Key? key,
    required this.isRunningLate,
    required this.vehicleModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.routes.name, extra: vehicleModel);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.w, bottom: 16.h),
        child: Container(
          width: 328.w,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE5EBF3)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bus Number',
                        style: TextStyle(
                          color: const Color(0xFF6B778C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SubtractText(input: vehicleModel.vehicleNumber),
                    ],
                  ),
                  Container(
                    height: 24.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE5EBF3),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.w, color: const Color(0xFFE5EBF3)),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Trip no ',
                                style: TextStyle(
                                  color: const Color(0xFF334155),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: vehicleModel.tripId.toString(),
                                style: TextStyle(
                                  color: const Color(0xFF334155),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 288.w,
                height: 1.h,
                decoration: const BoxDecoration(color: Color(0xFFF2F3F7)),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start trip',
                        style: TextStyle(
                          color: const Color(0xFF6B778C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        vehicleModel.startTime,
                        style: TextStyle(
                          color: const Color(0xFF334155),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 90.w,
                    height: 34.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF4E0BBB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Center(
                      child: Text(
                        'Track trip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SubtractText(input: vehicleModel.vehicleNumber),
              //     Row(
              //       mainAxisSize: MainAxisSize.min,
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.people_alt_outlined,
              //           size: 13.sp,
              //           color: const Color(0xFF4E0BBB),
              //         ),
              //         SizedBox(width: 4.w),
              //         Text(
              //           vehicleModel.livePassengerCount.toString(),
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             color: const Color(0xFF4E0BBB),
              //             fontSize: 13.sp,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //         const SizedBox(width: 4),
              //         Container(
              //           width: 6,
              //           height: 6,
              //           decoration: const ShapeDecoration(
              //             color: Color(0xFF13A579),
              //             shape: OvalBorder(),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 8.h,
              // ),
              // Container(
              //   width: 288.w,
              //   height: 1.h,
              //   decoration: const BoxDecoration(color: Color(0xFFF2F3F7)),
              // ),
              // SizedBox(
              //   height: 8.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       vehicleModel.fromLocation,
              //       style: TextStyle(
              //         color: const Color(0xFF080E2C),
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     Text(
              //       vehicleModel.toLocation,
              //       textAlign: TextAlign.right,
              //       style: TextStyle(
              //         color: const Color(0xFF080E2C),
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       vehicleModel.startTime,
              //       style: TextStyle(
              //         color: const Color(0xFF6B778C),
              //         fontSize: 12.sp,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     Row(
              //       children: [
              //         Icon(
              //           Icons.timer_sharp,
              //           color: const Color(0xFFDE1C22),
              //           size: 12.sp,
              //         ),
              //         SizedBox(
              //           width: 4.w,
              //         ),
              //         Text(
              //           '1hr 22m delay',
              //           style: TextStyle(
              //             color: const Color(0xFFDE1C22),
              //             fontSize: 12.sp,
              //             fontFamily: 'Poppins',
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Text(
              //       vehicleModel.endTime,
              //       textAlign: TextAlign.right,
              //       style: TextStyle(
              //         color: const Color(0xFF6B778C),
              //         fontSize: 12.sp,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 8.h,
              // ),
              // Container(
              //   width: 288.w,
              //   height: 1.h,
              //   decoration: const BoxDecoration(color: Color(0xFFF2F3F7)),
              // ),
              // SizedBox(
              //   height: 8.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     AmountTile(
              //       name: "Revenue",
              //       description: "₹ ${vehicleModel.totalRevenue}",
              //     ),
              //     AmountTile(
              //       name: "Expense",
              //       description: "₹ ${vehicleModel.totalExpense}",
              //     ),
              //     AmountTile(
              //       name: "Profit",
              //       description: "₹ ${vehicleModel.profit}",
              //     ),
              //   ],
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
