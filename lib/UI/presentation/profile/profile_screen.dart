import 'package:admin_app/UI/presentation/auth/bloc/auth_bloc.dart';
import 'package:admin_app/UI/presentation/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileInfTile extends StatelessWidget {
  final String name;
  final String description;

  final String leading;
  const ProfileInfTile({
    super.key,
    required this.name,
    required this.description,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 27.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(leading),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: const Color(0xFF262D3B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: const Color(0xFF8D9EB2),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(
              color: const Color(0xFF273648),
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          )),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is ProfileInitial || state is ProfileLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is ProfileFetched
                  ? SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 45.h),
                                    child: Container(
                                      width: 328.w,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFFEFF1F5)),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 69.h,
                                          ),
                                          ProfileInfTile(
                                            leading:
                                                "assets/icons/profile_icon_1.svg",
                                            name: state.profileModel.name,
                                            description:
                                                state.profileModel.number,
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          ProfileInfTile(
                                            leading:
                                                "assets/icons/profile_icon_2.svg",
                                            name: 'Association Name',
                                            description:
                                                state.profileModel.companyName,
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          ProfileInfTile(
                                            leading:
                                                "assets/icons/profile_icon_3.svg",
                                            name: 'Company PAN',
                                            description:
                                                state.profileModel.companyPan,
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90.h,
                                    height: 90.h,
                                    decoration: ShapeDecoration(
                                        shape: OvalBorder(
                                          side: BorderSide(
                                            width: 3.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: const Color(0x3F000000),
                                            blurRadius: 4.r,
                                            offset: const Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                        image: state.profileModel.profilePicture
                                                .isEmpty
                                            ? null
                                            : DecorationImage(
                                                image: NetworkImage(state
                                                    .profileModel
                                                    .profilePicture))),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 328.w,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFEFF1F5)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 12.0.h, bottom: 12.h),
                                child: const ProfileInfTile(
                                  leading: "assets/icons/profile_icon_4.svg",
                                  name: 'Platform charges',
                                  description:
                                      "Click to view subscription plans",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              width: 328.w,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFEFF1F5)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 12.0.h, bottom: 12.h),
                                child: const ProfileInfTile(
                                  leading: "assets/icons/profile_icon_5.svg",
                                  name: 'Privacy policy',
                                  description: "Click here to read",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(const LogoutEvent());
                              },
                              child: Container(
                                width: 328.w,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFFEFF1F5)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 12.0.h, bottom: 12.h),
                                  child: const ProfileInfTile(
                                    leading: "assets/icons/profile_icon_6.svg",
                                    name: 'Logout',
                                    description: "Click to logout of account",
                                  ),
                                ),
                              ),
                            )
                            // InkWell(

                            //   child: const ProfileInfTile(
                            //     isIcon: true,
                            //     leading: Icon(
                            //       Icons.login_outlined,
                            //       color: Color(0xFFF7444E),
                            //     ),
                            //     name: "Logout",
                            //     description: "",
                            //   ),
                            // ),
                          ]),
                    )
                  : const Center(
                      child: Text("error"),
                    );
        },
      ),
    );
  }
}
