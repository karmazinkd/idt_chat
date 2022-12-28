import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/constants/app_colors.dart';
import 'package:idt_chat/common/helpers/extensions.dart';
import 'package:idt_chat/home/models/bo/chat_message_model.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessageModel model;

  const ChatMessageBubble({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(model.isOwners){
      return _OwnersBubble(model: model);
    }else{
      return _OthersBubble(model: model);
    }
  }
}

class _OthersBubble extends StatelessWidget {
  final ChatMessageModel model;

  const _OthersBubble({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 12.w, right: 36.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: model.avatarColor,
            radius: 22.r,
            child: Text(
              model.avatarLetter,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.chatBubbleColorOther,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.sender,
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        model.message,
                        style: context.theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        model.modifiedTimeFriendly,
                        style: context.theme.textTheme.bodyText2?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OwnersBubble extends StatelessWidget {
  final ChatMessageModel model;

  const _OwnersBubble({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 36.w, right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.chatBubbleColorOwner,
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.message,
                      style: context.theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      model.modifiedTimeFriendly,
                      style: context.theme.textTheme.bodyText2?.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

