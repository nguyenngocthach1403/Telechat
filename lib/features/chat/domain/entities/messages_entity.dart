// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:telechat/features/chat/domain/entities/message_entity.dart';

class MessagesEntity extends Equatable {
  final List<MessageEntity> messages;
  const MessagesEntity({
    this.messages = const [],
  });

  MessagesEntity copyWith({
    List<MessageEntity>? messages,
  }) {
    return MessagesEntity(
      messages: messages ?? this.messages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messages': messages.map((x) => x.toMap()).toList(),
    };
  }

  factory MessagesEntity.fromMap(Map<String, dynamic> map) {
    return MessagesEntity(
      messages: List<MessageEntity>.from(
        (map['messages'] as List<dynamic>).map<MessageEntity>(
          (x) => MessageEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessagesEntity.fromJson(String source) =>
      MessagesEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [messages];
}
