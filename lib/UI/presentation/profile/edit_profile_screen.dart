import 'package:admin_app/UI/components/textfield/text_feild_component.dart';
import 'package:admin_app/UI/presentation/profile/cubit/profile_cubit.dart';
import 'package:admin_app/UI/presentation/profile/models/profile_model.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:admin_app/core/utils/formater.dart';
import 'package:admin_app/core/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController assosiationController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  ProfileModel? profileModel;
  final panCardFormatter = MaskTextInputFormatter(
    mask: 'AAAAA9999A', // PAN Card format: 5 letters, 4 digits, 1 letter
    filter: {
      "A": RegExp(r'[A-Z]'), // Only allow uppercase letters
      "9": RegExp(r'[0-9]'), // Only allow digits
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(0xFF4E0BBB)),
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
          if (state is ProfileFetched) {
            profileModel = state.profileModel;
          }
          if (state is ProfileEditSuccess) {
            showToast(state.message);
            //    profileModel = state.profileModel;
          }
          // TODO: implement listener
        }, builder: (context, state) {
          return state is ProfileInitial ||
                  state is ProfileLoading ||
                  state is ProfileEditLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Change picture',
                        style: TextStyle(
                          color: const Color(0xFF797B80),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 312.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
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
                                textInputType: TextInputType.text,
                                controller: nameController,
                                hintText: profileModel!.name),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 312.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Association name',
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
                                textInputType: TextInputType.text,
                                controller: assosiationController,
                                hintText: profileModel!.companyName),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 312.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company PAN',
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
                                  FilteringTextInputFormatter.allow(RegExp(
                                      r'[a-zA-Z0-9]')), // Allow only letters and digits
                                  UpperCaseTextFormatter(), // Convert letters to uppercase
                                  panCardFormatter, // Apply the PAN card format
                                ],
                                // textInputType: TextInputType.text,
                                controller: panController,
                                hintText: profileModel!.companyPan),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      InkWell(
                        onTap: () {
                          locator<ProfileCubit>().editProfile(
                              name: nameController.text.isEmpty
                                  ? profileModel?.name.toString()
                                  : nameController.text,
                              assosiation: assosiationController.text.isEmpty
                                  ? profileModel?.companyName.toString()
                                  : assosiationController.text,
                              pan: panController.text.isEmpty
                                  ? profileModel?.companyPan.toString()
                                  : panController.text);
                        },
                        child: Container(
                          width: 312.w,
                          height: 38.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4E0BBB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: state is ProfileEditLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Update',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
        }));
  }
}
