import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountTile extends StatelessWidget {
  final String name;
  final String description;
  const AmountTile({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: const Color(0xFF6B778C),
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: const Color(0xFF080E2C),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
