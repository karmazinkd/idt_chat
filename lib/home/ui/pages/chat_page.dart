import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/constants/animation_constants.dart';
import 'package:idt_chat/common/constants/app_colors.dart';
import 'package:idt_chat/common/constants/app_styles.dart';
import 'package:idt_chat/common/helpers/extensions.dart';
import 'package:idt_chat/common/helpers/injections.dart';
import 'package:idt_chat/home/cubits/chat_cubit.dart';
import 'package:idt_chat/home/cubits/chat_state.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';
import 'package:idt_chat/home/models/bo/chat_message_model.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';
import 'package:idt_chat/home/ui/widgets/chat_list_item_shimmer.dart';
import 'package:idt_chat/home/ui/widgets/chat_message_bubble.dart';

class ChatPage extends StatefulWidget {
  final ChatListItemCardModel model;

  const ChatPage({required this.model, Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();
  final scrollController = ScrollController();
  late ChatCubit cubit;

  @override
  void initState() {
    cubit = ChatCubit(
      repository: getIt<IChatRepository>(),
      chatModel: widget.model,
    )..fetch();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/chat_bg.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverAppBar(
                        leading: const BackButton(),
                        title: widget.model.members.length > 1
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.model.chatTitle),
                                  SizedBox(height: 3.h),
                                  Text(
                                    '${widget.model.members.length} ${tr.members}',
                                    style: context.theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.appBarTitle,
                                    ),
                                  ),
                                ],
                              )
                            : Text(widget.model.chatTitle),
                        floating: true,
                      ),
                      BlocProvider(
                        create: (BuildContext context) => cubit,
                        child: BlocConsumer<ChatCubit, ChatState>(
                          listener: (context, state) {
                            state.maybeMap(
                                orElse: () {},
                                success: (_) {
                                  scrollToBottom();
                                });
                          },
                          builder: (context, state) {
                            return state.map(
                              loading: (_) => const _Loading(),
                              failed: (failure) => _Failed(message: failure.message),
                              success: (success) => _Fetched(messages: success.messages),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: AppColors.divider, height: 2.h),
                Container(
                  color: AppColors.background,
                  height: 50.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                              hintText: tr.typeAMessage,
                              contentPadding: EdgeInsets.only(left: 12.w)),
                          style: AppStyles.messageEditor,
                          onEditingComplete: sendMessage,
                          onTap: () {
                            scrollToBottom();
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: sendMessage,
                        child: Icon(
                          Icons.send,
                          color: context.theme.colorScheme.primary,
                          size: 32.w,
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: AnimationConstants.chatScrollDelayMs), () {
      if (mounted && scrollController.hasClients) {
        final position = scrollController.position.maxScrollExtent;
        scrollController.animateTo(
          position,
          duration: const Duration(milliseconds: AnimationConstants.chatScrollDurationMs),
          curve: Curves.ease,
        );
      }
    });
  }

  void sendMessage() {
    cubit.sendMessage(textController.text);
    textController.text = '';
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const ChatListItemShimmer();
      }, childCount: 5),
    );
  }
}

class _Failed extends StatelessWidget {
  final String message;

  const _Failed({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _Fetched extends StatelessWidget {
  final List<ChatMessageModel> messages;

  const _Fetched({required this.messages, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(tr.noMessages, style: context.theme.textTheme.titleMedium),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ChatMessageBubble(
            model: messages[index],
          );
        }, childCount: messages.length),
      );
    }
  }
}
