import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/chat/domain/entities/message_entity.dart';
import 'package:telechat/features/chat/domain/usecases/get_all_message_usecase.dart';
import 'package:telechat/features/group/domain/usecases/get_current_uid.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetAllMessageUseCase _getAllMessageUseCase;
  final GetCurrentUID _getCurrentUID;
  MessageBloc(this._getAllMessageUseCase, this._getCurrentUID)
      : super(MessageState(status: MessageStatus.initial)) {
    on<LoadMessage>(loadMessage);
  }

  loadMessage(LoadMessage e, Emitter<MessageState> emit) async {
    emit(state.copyWith(status: MessageStatus.loading));

    final res = await _getAllMessageUseCase.call(e.groupId);
    final currentUid = await _getCurrentUID.call(Void);

    if (res is DataSuccess) {
      if (currentUid.isEmpty) {
        emit(state.copyWith(
            error: 'Load message failed!', status: MessageStatus.failded));
        return;
      }
      if (res.data == null) {
        emit(state.copyWith(
            error: 'Load message failed!', status: MessageStatus.failded));
        return;
      }

      final messages = isMe(res.data!, currentUid);

      emit(state.copyWith(messages: messages, status: MessageStatus.loaded));
    } else {
      emit(state.copyWith(error: res.error, status: MessageStatus.failded));
    }
  }

  List<MessageEntity> isMe(List<MessageEntity> messages, String currentUid) {
    final List<MessageEntity> rs = [];
    for (var message in messages) {
      if (message.sender != currentUid) {
        rs.add(message);
      }
      rs.add(MessageEntity(
        content: message.content,
        id: message.id,
        isMe: true,
        sender: message.sender,
        time: message.time,
        viewers: message.viewers,
      ));
    }
    return rs;
  }
}
