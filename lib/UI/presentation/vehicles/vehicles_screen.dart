import 'package:admin_app/UI/components/nodata/no_data.dart';
import 'package:admin_app/UI/presentation/home/cubit/home_cubit.dart';
import 'package:admin_app/UI/presentation/vehicles/widget/vehicle_tile.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              title: Text(
                'Your Vehicles',
                style: TextStyle(
                  color: textBlckColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: [
                SvgPicture.asset("assets/icons/search.svg"),
                const SizedBox(
                  width: 10,
                ),
                // SvgPicture.asset("assets/icons/sort.svg"),
                // const SizedBox(
                //   width: 10,
                // ),
              ],
            ),
            body: state is VehicleFetchInitial
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is VehicleFecthedState
                    ? state.list.isEmpty
                        ? NoData(
                            onTap: () {
                              locator<HomeCubit>().getVehicles();
                            },
                          )
                        : ListView.builder(
                            itemCount: state.list.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => VehicleTile(
                              vehicleModel: state.list[index],
                              isRunningLate: true,
                            ),
                          )
                    : const Text("Error")

            //  SingleChildScrollView(
            //   child: Column(children: [
            //     GestureDetector(
            //       onTap: () => RouteConfig.liveTracking(context),
            //       child: const VehicleTile(
            //         isRunningLate: false,
            //       ),
            //     ),
            //     const VehicleTile(
            //       isRunningLate: true,
            //     ),
            //     const VehicleTile(
            //       isRunningLate: true,
            //     ),
            //     const VehicleTile(
            //       isRunningLate: true,
            //     ),
            //   ]),
            // ),
            );
      },
    );
  }
}
