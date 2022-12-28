import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/constants/app_colors.dart';

abstract class AppStyles{

  static final TextStyle messageEditor = TextStyle(
    color: AppColors.body,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );

}