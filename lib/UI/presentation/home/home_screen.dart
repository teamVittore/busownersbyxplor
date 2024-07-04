import 'package:admin_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: child,
        bottomNavigationBar: Container(
          width: 360.w,
          height: 63.h,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x214D4D52),
                blurRadius: 16,
                offset: Offset(0, 2),
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Color(0x1EFFFFFF),
                blurRadius: 1,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => context.pushNamed(
                      Routes.dashboard.name,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/dashboard.svg",
                          color: GoRouterState.of(context).uri.toString() ==
                                  Routes.dashboard.path
                              ? const Color(0xFF5D7CFB)
                              : const Color(0xFFC9CBD2),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 66.w,
                          child: Text(
                            'Dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: GoRouterState.of(context).uri.toString() ==
                                      Routes.dashboard.path
                                  ? const Color(0xFF5D7CFB)
                                  : const Color(0xFFC9CBD2),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 48.w),

                  InkWell(
                    onTap: () => context.pushNamed(
                      Routes.vehicles.name,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/live.svg",
                          color: GoRouterState.of(context).uri.toString() ==
                                  Routes.vehicles.path
                              ? const Color(0xFF5D7CFB)
                              : const Color(0xFFC9CBD2),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 66.w,
                          child: Text(
                            'Live Trips',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: GoRouterState.of(context).uri.toString() ==
                                      Routes.vehicles.path
                                  ? const Color(0xFF5D7CFB)
                                  : const Color(0xFFC9CBD2),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 48.w),
                  InkWell(
                    onTap: () => context.pushNamed(
                      Routes.profile.name,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/profile.svg",
                          color: GoRouterState.of(context).uri.toString() ==
                                  Routes.profile.path
                              ? const Color(0xFF5D7CFB)
                              : const Color(0xFFC9CBD2),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 66.w,
                          child: Text(
                            'Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: GoRouterState.of(context).uri.toString() ==
                                      Routes.profile.path
                                  ? const Color(0xFF5D7CFB)
                                  : const Color(0xFFC9CBD2),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   width: 82.w,
                  //   height: 56.h,
                  //   child: Column(
                  //     children: [
                  //       SvgPicture.asset(
                  //         "assets/icons/home.svg",
                  //       ),
                  //       SizedBox(
                  //         width: 66,
                  //         child: Text(
                  //           'Home',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: const Color(0xFF5D7CFB),
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )

        //  Consumer<AppNavigation>(
        //   builder: (context, appNavigation, child) {
        //     return BottomNavigationBar(
        //       unselectedItemColor: const Color(0xFFC9CBD2),
        //       selectedItemColor: const Color(0xFF5D7CFB),
        //       currentIndex: appNavigation.currentIndex,
        //       onTap: (index) {
        //         appNavigation.changePage(index);
        //       },
        //       items: [
        //         BottomNavigationBarItem(
        //           icon: SvgPicture.asset("assets/icons/home.svg",
        //               color: appNavigation.currentPage == AppPage.home
        //                   ? const Color(0xFF5D7CFB)
        //                   : const Color(0xFFC9CBD2)),
        //           label: 'Home',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: SvgPicture.asset("assets/icons/profile.svg",
        //               color: appNavigation.currentPage == AppPage.profile
        //                   ? const Color(0xFF5D7CFB)
        //                   : const Color(0xFFC9CBD2)),
        //           label: 'Profile',
        //         ),
        //       ],
        //     );
        //   },
        // ),
        );
  }
}
