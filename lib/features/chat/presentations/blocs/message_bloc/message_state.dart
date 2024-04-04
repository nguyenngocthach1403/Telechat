part of 'message_bloc.dart';

// ignore: must_be_immutable
class MessageState extends Equatable {
  MessageState({
    this.messages = const [],
    this.error,
    this.status = MessageStatus.initial,
  });
  List<MessageEntity> messages;
  String? error;
  MessageStatus status;

  MessageState copyWith({
    final List<MessageEntity>? messages,
    final String? error,
    final MessageStatus? status,
  }) {
    return MessageState(
      error: error ?? this.error,
      messages: messages ?? this.messages,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [messages, error, status];
}

enum MessageStatus { initial, loading, loaded, failded }
