import 'package:admin_app/core/theme/contianer_theme.dart';
import 'package:admin_app/core/theme/textstyle_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldComponent extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final String? labelText;
  final String hintText;
  final bool isPassword;
  final bool hasError;
  final String errorText;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldComponent({
    super.key,
    required this.controller,
    this.labelText,
    this.readOnly = false,
    required this.hintText,
    this.isPassword = false,
    this.hasError = false,
    this.errorText = '',
    this.onChanged,
    this.onSaved,
    this.validator,
    this.textInputType,
    this.suffixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 14.h,
        bottom: 14.h,
        right: 16.w,
      ),
      decoration: containerBorderGrey,
      child: TextFormField(
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        readOnly: readOnly,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          isDense: true,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xFF728492),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          errorText: hasError ? errorText : null,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}

class TextFieldComponentTitle extends StatelessWidget {
  final void Function()? ontap;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool hasError;
  final String errorText;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Decoration? decoration;

  const TextFieldComponentTitle({
    super.key,
    required this.controller,
    required this.labelText,
    this.readOnly = false,
    required this.hintText,
    this.isPassword = false,
    this.hasError = false,
    this.errorText = '',
    this.onChanged,
    this.onSaved,
    this.validator,
    this.textInputType,
    this.suffixIcon,
    this.ontap,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 8.w, 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelText,
                style: text12W400(const Color(0xFF768EA0)),
              ),
              TextFormField(
                onTap: ontap,
                keyboardType: textInputType,
                readOnly: readOnly,
                controller: controller,
                obscureText: isPassword,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0.0),
                  //  contentPadding: const EdgeInsets.all(0),
                  isDense: true,

                  // labelText: labelText,
                  hintText: hintText,
                  hintStyle: text14w400(const Color(0xFFC6D0D7)),

                  errorText: hasError ? errorText : null,
                  border: InputBorder.none,
                ),
                onChanged: onChanged,
                onSaved: onSaved,
                validator: validator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWithBorder extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextInputType? type;
  final bool autofocus;
  final bool readOnly;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldWithBorder({
    super.key,
    this.controller,
    required this.hintText,
    required this.labelText,
    this.suffix,
    this.validator,
    this.onTap,
    this.type,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      autofocus: autofocus,
      enabled: enabled,
      controller: controller,
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(left: 16.w, top: 14.h, bottom: 14.h),
          labelText: labelText,
          hintText: hintText,
          labelStyle: text14w400(const Color(0xFF6B778C)),
          hintStyle: text14w400(const Color(0xFF6B778C)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(width: 1, color: Color(0xFFE5EBF3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                width: 1, color: Color(0xFFE5EBF3)), // Change the color here
          ),
          suffixIcon: suffix),
    );
  }
}
