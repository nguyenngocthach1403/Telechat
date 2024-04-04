part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class LoadMessage extends MessageEvent {
  final String groupId;
  const LoadMessage(this.groupId);
}

class SendMessage extends MessageEvent {
  final String groupId;
  const SendMessage(this.groupId);
}
