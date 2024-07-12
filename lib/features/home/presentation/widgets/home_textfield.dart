import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.mainColor,
          ),
          hintText: 'what do you search for?',
          hintStyle: TextStyle(
            color: AppColors.mainColor,
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          )),
    );
  }
}
