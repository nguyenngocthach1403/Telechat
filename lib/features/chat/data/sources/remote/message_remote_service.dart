import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telechat/core/constants/strings.dart';
import 'package:telechat/features/chat/data/models/message_model.dart';
import 'package:telechat/features/chat/domain/entities/message_entity.dart';

abstract class MessageRemoteService {
  Future<List<MessageEntity>> getAllMessage(String groupId);
}

class MessageRemoteServiceImpl implements MessageRemoteService {
  FirebaseFirestore _firestore;
  MessageRemoteServiceImpl(this._firestore);
  @override
  Future<List<MessageEntity>> getAllMessage(String groupId) async {
    final groupDoc = await _firestore.collection(groupDocument).doc(groupId);
    final doc = await groupDoc.collection(messageDocument).get();
    final messages = doc.docs.map((e) => MessageModel.fromSnapshot(e)).toList();
    return messages;
  }
}
