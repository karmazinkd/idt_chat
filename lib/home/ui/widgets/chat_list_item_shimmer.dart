import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/constants/app_colors.dart';
import 'package:idt_chat/home/ui/widgets/shimmer_rect.dart';

class ChatListItemShimmer extends StatelessWidget {
  const ChatListItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cards,
      margin: EdgeInsets.all(2.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.shimmer2,
              radius: 28.r,
              child: const SizedBox.shrink(),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerRect(width: 120.w, height: 20.h),
                  SizedBox(height: 4.h),
                  ShimmerRect(width: 250.w, height: 16.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
