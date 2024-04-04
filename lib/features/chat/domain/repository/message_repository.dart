import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/chat/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<DataState<List<MessageEntity>, String>> getAllMessage(String groupId);
}
