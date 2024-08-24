import 'package:admin_app/UI/presentation/vehicle_trip/cubit/vehicle_trip_cubit.dart';
import 'package:admin_app/UI/presentation/vehicle_trip/models/trip_model.dart';
import 'package:admin_app/core/utils/time_convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class VehicleTripDataTile extends StatelessWidget {
  final TripModel tripModel;
  const VehicleTripDataTile({
    super.key,
    required this.tripModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Container(
        width: 328.w,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: const Color(0xFFE5EBF3)),
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 14.h,
            bottom: 14.h,
            right: 20.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trip No',
                        style: TextStyle(
                          color: const Color(0xFF6B778C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        tripModel.tripId.toString(),
                        style: TextStyle(
                          color: const Color(0xFF334155),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE5EBF3),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE5EBF3)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 8.0.w,
                        right: 8.w,
                        bottom: 4.h,
                        top: 4.h,
                      ),
                      child: Center(
                        child: Text(
                          'Revenue: ₹${tripModel.totalRevenue}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF334155),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
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
                decoration: const BoxDecoration(color: Color(0xFFE5EBF3)),
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
                        'Date',
                        style: TextStyle(
                          color: const Color(0xFF6B778C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        DateFormat('dd MMM yy')
                            .format(DateTime.parse(tripModel.date)),
                        style: TextStyle(
                          color: const Color(0xFF334155),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start time',
                        style: TextStyle(
                          color: const Color(0xFF6B778C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        convertTime(tripModel.startTime),
                        style: TextStyle(
                          color: const Color(0xFF334155),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'End time',
                        style: TextStyle(
                          color: const Color(0xFF6B778C),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        convertTime(tripModel.endTime),
                        style: TextStyle(
                          color: const Color(0xFF334155),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VehicleTripPage extends StatelessWidget {
  final String name;
  const VehicleTripPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          name,
          style: TextStyle(
            color: const Color(0xFF0B1323),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        child: BlocConsumer<VehicleTripCubit, VehicleTripState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.when(
                error: (message) => Center(
                      child: Text(message),
                    ),
                initial: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                success: (tripListModel) => ListView.builder(
                      itemCount: tripListModel.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => VehicleTripDataTile(
                        tripModel: tripListModel[index],
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
