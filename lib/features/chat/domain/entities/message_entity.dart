// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String id;
  final String content;
  final String time;
  final List<String> viewers;
  final String sender;
  final bool isMe;
  const MessageEntity({
    this.id = '',
    this.content = '',
    this.sender = '',
    this.viewers = const [],
    this.time = '',
    this.isMe = false,
  });

  MessageEntity copyWith({
    String? id,
    String? content,
    String? time,
    List<String>? viewers,
    String? sender,
    bool? isMe,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      time: time ?? this.time,
      viewers: viewers ?? this.viewers,
      sender: sender ?? this.sender,
      isMe: isMe ?? this.isMe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'time': time,
      'viewers': viewers,
      'sender': sender,
      'isMe': isMe,
    };
  }

  factory MessageEntity.fromMap(Map<String, dynamic> map) {
    return MessageEntity(
      id: map['id'] as String,
      content: map['content'] as String,
      time: map['time'] as String,
      viewers: List<String>.from((map['viewers'] as List<String>)),
      sender: map['sender'] as String,
      isMe: map['isMe'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageEntity.fromJson(String source) =>
      MessageEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      content,
      time,
      viewers,
      sender,
      isMe,
    ];
  }
}
