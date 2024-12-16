import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times/core/utils/app_colors.dart';

ThemeData appTheme(){
  return ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white
      ),
      backgroundColor:AppColors.appBarColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color:AppColors.white,
        fontSize: 18.sp
      )
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color:AppColors.black
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color:AppColors.grey
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.grey
      )
    )

  );
}