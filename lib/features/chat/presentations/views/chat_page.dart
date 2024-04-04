import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/features/chat/presentations/blocs/message_bloc/message_bloc.dart';
import 'package:telechat/features/chat/presentations/widgets/chat_body.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/injection.container.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.group});
  final GroupEntity group;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MessageBloc>()..add(LoadMessage(group.groupId)),
      child: ChatBody(
        group: group,
      ),
    );
  }
}
