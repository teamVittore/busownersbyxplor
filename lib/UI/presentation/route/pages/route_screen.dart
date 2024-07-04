import 'package:admin_app/UI/presentation/home/model/vehicle_model.dart';
import 'package:admin_app/UI/presentation/route/components/location_tile.dart';
import 'package:admin_app/UI/presentation/route/components/map_box.dart';
import 'package:admin_app/UI/presentation/route/cubit/route_cubit.dart';
import 'package:admin_app/UI/presentation/vehicles/widget/substracted_text.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RouteScreen extends StatefulWidget {
  final VehicleModel vehicleModel;
  const RouteScreen({super.key, required this.vehicleModel});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator<RouteCubit>()
        ..getRoute(vehicleId: widget.vehicleModel.vehicleId.toString()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            scrolledUnderElevation: 0,

            // automaticallyImplyLeading: true,
            // leading: GestureDetector(
            //   onTap: () => context.pop(),
            //   child: const Icon(
            //     Icons.arrow_back,
            //     color: Color(0xFF676B76),
            //   ),
            // ),
            title: const Text(
              'Live tracking',
              style: TextStyle(
                color: Color(0xFF0B1323),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SizedBox(
                  width: 99.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SubtractText(input: widget.vehicleModel.vehicleNumber),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.people_alt_outlined,
                                size: 11.sp,
                                color: const Color(0xFF4E0BBB),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '58',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF4E0BBB),
                                  fontSize: 11.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Icon(
                                Icons.circle,
                                color: const Color(0xFF13A579),
                                size: 11.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/ticket.svg",
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '58',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF4E0BBB),
                                  fontSize: 11.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: BlocConsumer<RouteCubit, RouteState>(
            builder: (context, state) => state.when(
              error: (message) => const Center(
                child: Text("error"),
              ),
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              sucess: (routes) => Column(
                children: [
                  SizedBox(
                      width: 360.w,
                      height: 321.h,
                      child: MapSample(
                        locations: routes,
                      )),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 16.0.w,
                                top: 12.h,
                              ),
                              child: Container(
                                width: 62.w,
                                height: 24.h,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFDFFAE8),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFFC2D4C8)),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'On Time',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF334155),
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const LocationTile(
                            type: 0,
                            name: "Kochi airport",
                            description: "8:30 am",
                          ),
                          const LocationTile(
                            type: 1,
                            name: "Kochi airport",
                            description: "8:30 am",
                          ),
                          const LocationTile(
                            type: 2,
                            name: "Kochi airport",
                            description: "8:30 am",
                          ),
                          const LocationTile(
                            type: 4,
                            name: "Kochi airport",
                            description: "8:30 am",
                          ),
                          const LocationTile(
                            type: 3,
                            name: "Kochi airport",
                            description: "8:30 am",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            listener: (context, state) {},
          )),
    );
  }
}
