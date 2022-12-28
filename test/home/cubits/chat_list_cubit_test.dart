import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/common/helpers/avatar_helper.dart';
import 'package:idt_chat/common/helpers/date_time_helper.dart';
import 'package:idt_chat/common/models/result.dart';
import 'package:idt_chat/home/cubits/chat_list_cubit.dart';
import 'package:idt_chat/home/cubits/chat_list_state.dart';
import 'package:idt_chat/home/models/bo/chat_list_item_model.dart';
import 'package:idt_chat/home/models/dto/chat_list_item_dto.dart';
import 'package:idt_chat/home/repositories/i_chat_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockIChatRepository extends Mock implements IChatRepository {}

void main() {
  group('EnableBiometricsScreenCubit', () {
    const List<ChatListItemDto> fetchedDataDto = [
      ChatListItemDto(
        id: '1',
        lastMessage: 'test message',
        members: ['A', 'B'],
        topic: 'test topic',
        modifiedAt: 1512813026153,
      ),
    ];
    List<ChatListItemCardModel> fetchedDataModels = [
      ChatListItemCardModel(
        avatarColor: AvatarHelper.generateColorFromText('test topic'),
        avatarLetter: AvatarHelper.getAvatarLetterForGroup(['A', 'B'], 'test topic'),
        chatTitle: 'test topic',
        chatId: '1',
        lastMessage: 'test message',
        members: const ['A', 'B'],
        modifiedAt: 1512813026153,
        modifiedTimeFriendly: DateTimeHelper.formatFriendly(1512813026153),
      ),
    ];

    late IChatRepository mockRepository;
    late ChatListCubit cubit;

    setUp(() {
      mockRepository = MockIChatRepository();
      cubit = ChatListCubit(repository: mockRepository);
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is ChatListState.loading()', () {
      expect(cubit.state.runtimeType, const ChatListState.loading().runtimeType);
    });

    blocTest<ChatListCubit, ChatListState>(
      'Successful fetch(): '
      'repository.fetchChatList() is called , '
      'states order: ChatListState.loading(), ChatListState.fetched(), '
      'emitted Fetched state contains correct list of processed records',
      build: () => cubit,
      act: (cubit) async {
        when(() => mockRepository.fetchChatList()).thenAnswer(
          (invocation) =>
              Future.value(const Result<List<ChatListItemDto>>.success(data: fetchedDataDto)),
        );

        await cubit.fetch();
      },
      expect: () =>
          [const ChatListState.loading(), ChatListState.success(chatList: fetchedDataModels)],
      verify: (cubit) {
        verify(() => mockRepository.fetchChatList()).called(1);
      },
    );
  });
}
