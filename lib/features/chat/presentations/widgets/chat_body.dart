import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/utils/widgets/loader.dart';
import 'package:telechat/features/chat/presentations/blocs/message_bloc/message_bloc.dart';

import 'package:telechat/features/chat/presentations/widgets/appbar.dart';
import 'package:telechat/features/chat/presentations/widgets/chat_text_box.dart';
import 'package:telechat/features/chat/presentations/widgets/message_box.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key, required this.group});
  final GroupEntity group;

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  TextEditingController controlerTextField = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        group: widget.group,
        pressPop: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatList()),
          //
          const ChatTextBox(),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if (state.status == MessageStatus.failded ||
            state.status == MessageStatus.loading && state.messages.isEmpty) {
          return Loader();
        }
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.messages.length,
                (context, index) => MessageBox(
                  message: state.messages[index],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MessageEntityDemo {
  final String message;
  final String dateTime;
  final bool isMe;
  MessageEntityDemo({
    required this.message,
    required this.dateTime,
    required this.isMe,
  });
}

List<MessageEntityDemo> demo = [
  MessageEntityDemo(
      message: 'Hello! Tao la Thach', dateTime: '10:20', isMe: true),
  MessageEntityDemo(
      message: 'May dao nay co khoe khong', dateTime: '10:20', isMe: true),
  MessageEntityDemo(
      message: 'Tao khoe, con may', dateTime: '10:20', isMe: false),
  MessageEntityDemo(message: 'Tao cung day', dateTime: '10:20', isMe: true),
  MessageEntityDemo(
      message: 'Tao nghe noi dao nay may lao lam',
      dateTime: '10:20',
      isMe: true),
  MessageEntityDemo(
      message: 'Dau co tao van nhu moi khi', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Gap thang nao danh thang do thoi',
      dateTime: '10:20',
      isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
  MessageEntityDemo(
      message: 'Sao may lai noi the', dateTime: '10:20', isMe: false),
];
