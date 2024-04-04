import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telechat/features/chat/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    final String id = '',
    final String content = '',
    final String sender = '',
    final List<String> viewers = const [],
    final String time = '',
    final bool isMe = false,
  });

  MessageModel.fromSnapshot(DocumentSnapshot snapshot)
      : super(
          id: snapshot.get('id'),
          content: snapshot.get('content'),
          sender: snapshot.get('sender'),
          viewers: List<String>.from(
              snapshot.get('viewers').map((e) => e.toString())),
          time: snapshot.get('time'),
        );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'sender': sender,
      'viewers': [],
      'time': DateTime.now(),
    };
  }
}
