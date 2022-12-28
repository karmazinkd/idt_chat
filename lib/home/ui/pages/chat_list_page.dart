import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idt_chat/common/constants/app_colors.dart';
import 'package:idt_chat/common/helpers/extensions.dart';
import 'package:idt_chat/common/helpers/injections.dart';
import 'package:idt_chat/home/cubits/chat_list_cubit.dart';
import 'package:idt_chat/home/cubits/chat_list_state.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';
import 'package:idt_chat/home/ui/widgets/chat_list_item.dart';
import 'package:idt_chat/home/ui/widgets/chat_list_item_shimmer.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(tr.appName),
              floating: true,
            ),
            BlocProvider(
              create: (BuildContext context) => ChatListCubit(
                repository: getIt<IChatRepository>(),
              )..fetch(),
              child: BlocBuilder<ChatListCubit, ChatListState>(
                builder: (context, state) {
                  return state.map(
                    loading: (_) => const _Loading(),
                    failed: (failure) => _Failed(message: failure.message),
                    success: (success) => _Fetched(models: success.chatList),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
  final List<ChatListItemCardModel> models;

  const _Fetched({required this.models, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (models.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(tr.noChats, style: context.theme.textTheme.titleMedium),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ChatListItem(
            model: models[index],
          );
        }, childCount: models.length),
      );
    }
  }
}
