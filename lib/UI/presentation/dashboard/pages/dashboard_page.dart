import 'package:admin_app/UI/presentation/dashboard/components/banner/clipper.dart';
import 'package:admin_app/UI/presentation/dashboard/components/home_vehicle_tile.dart';
import 'package:admin_app/UI/presentation/dashboard/components/time_selector.dart';
import 'package:admin_app/UI/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            const TimePeriodSelector(),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
        body: BlocConsumer<DashboardCubit, DashboardState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.when(
              error: (message) => Center(child: Text(message)),
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (revenueModel, selectedPeriod, start, end) =>
                  SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 4,
                        right: 16.0,
                      ),
                      child: CustomPaint(
                        painter: Cliper(),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: SizedBox(
                                width: 250.w,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Hi Anilkumar,\n',
                                        style: TextStyle(
                                          color: const Color(0xFF2C2C2C),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Your bus',
                                        style: TextStyle(
                                          color: const Color(0xFF2C2C2C),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'es are performing ',
                                        style: TextStyle(
                                          color: const Color(0xFF2C2C2C),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '2%',
                                        style: TextStyle(
                                          color: const Color(0xFF4E0BBB),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                          color: const Color(0xFF2C2C2C),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'better than',
                                        style: TextStyle(
                                          color: const Color(0xFF4E0BBB),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' last week.',
                                        style: TextStyle(
                                          color: const Color(0xFF2C2C2C),
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        left: 16.0.w,
                        right: 16.0.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: 160.w,
                            height: 154.h,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.0.w,
                                top: 16.0.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹ ${revenueModel.totalRevenue}',
                                    style: TextStyle(
                                      color: const Color(0xFF181818),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Total Revenue',
                                    style: TextStyle(
                                      color: const Color(0xFF181818),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: 160.w,
                            height: 154.h,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 16.0.w,
                                top: 16.0.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹ ${revenueModel.totalProfit}',
                                    style: TextStyle(
                                      color: const Color(0xFF181818),
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Total Profit',
                                    style: TextStyle(
                                      color: const Color(0xFF181818),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.h,
                        left: 16.0.w,
                        right: 16.0.w,
                        bottom: 16.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: 160.w,
                            height: 80.h,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '₹ ${revenueModel.totalUpiPayments}',
                                    style: TextStyle(
                                      color: const Color(0xFF4E0BBB),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Online Payment',
                                    style: TextStyle(
                                      color: const Color(0xFF181818),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: 160.w,
                            height: 80.h,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '₹ ${revenueModel.totalCashPayment}',
                                    style: TextStyle(
                                      color: const Color(0xFF4E0BBB),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Online Payment',
                                    style: TextStyle(
                                      color: const Color(0xFF181818),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Expenses',
                                  style: TextStyle(
                                    color: const Color(0xFF181818),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ($selectedPeriod)',
                                  style: TextStyle(
                                    color: const Color(0xFF181818),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Container(
                      width: 328.w,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFDEDDDD)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: revenueModel.busWiseData.length,
                            itemBuilder: (context, index) => HomeVehicleTile(
                              start: start,
                              end: end,
                              busWiseDataModel: revenueModel.busWiseData[index],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
