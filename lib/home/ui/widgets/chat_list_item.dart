import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/constants/app_colors.dart';
import 'package:idt_chat/common/helpers/extensions.dart';
import 'package:idt_chat/common/helpers/router.gr.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';

class ChatListItem extends StatelessWidget {
  final ChatListItemCardModel model;

  const ChatListItem({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cards,
      margin: EdgeInsets.all(2.r),
      child: InkWell(
        onTap: () => context.router.push(ChatRoute(model: model)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: model.avatarColor,
                radius: 28.r,
                child: Text(
                  model.avatarLetter,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            model.chatTitle,
                            style: context.theme.textTheme.titleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          model.modifiedTimeFriendly,
                          style: context.theme.textTheme.bodySmall,
                        )
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      model.lastMessage,
                      style: context.theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
