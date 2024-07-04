import 'package:admin_app/UI/presentation/auth/bloc/auth_bloc.dart';
import 'package:admin_app/UI/presentation/profile/cubit/profile_cubit.dart';
import 'package:admin_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileInfTile extends StatelessWidget {
  final String name;
  final String description;
  final bool isIcon;
  final Widget? leading;
  const ProfileInfTile({
    super.key,
    required this.name,
    required this.description,
    this.isIcon = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 27.0.w),
      child: isIcon
          ? Row(
              children: [
                leading!,
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xFF728492),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isIcon
                    ? leading!
                    : Container(
                        width: 24,
                        height: 24,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(),
                        ),
                      ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: const Color(0xFF728492),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: const Color(0xFF334155),
                        fontSize: 14.sp,
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
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFBAC5D1),
                              shape: OvalBorder(),
                            ),
                          ),
                          Text(
                            state.profileModel.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF334155),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            state.profileModel.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF8D9EB2),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          ProfileInfTile(
                            name: 'Association Name',
                            description: state.profileModel.companyName,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ProfileInfTile(
                            name: 'Company PAN',
                            description: state.profileModel.companyPan,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          GestureDetector(
                            onTap: () => context.pushNamed(
                              Routes.privacyPolicy.name,
                            ),
                            child: const ProfileInfTile(
                              isIcon: true,
                              leading: Icon(
                                Icons.privacy_tip,
                                color: Color(0xFF35475E),
                              ),
                              name: "Privacy",
                              description: "",
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(const LogoutEvent());
                            },
                            child: const ProfileInfTile(
                              isIcon: true,
                              leading: Icon(
                                Icons.login_outlined,
                                color: Color(0xFFF7444E),
                              ),
                              name: "Logout",
                              description: "",
                            ),
                          ),
                        ])
                  : const Center(
                      child: Text("error"),
                    );
        },
      ),
    );
  }
}
