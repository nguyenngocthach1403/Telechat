import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/chat/data/sources/remote/message_remote_service.dart';
import 'package:telechat/features/chat/domain/entities/message_entity.dart';
import 'package:telechat/features/chat/domain/repository/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  MessageRemoteService _messageRemoteService;
  MessageRepositoryImpl(this._messageRemoteService);
  @override
  Future<DataState<List<MessageEntity>, String>> getAllMessage(
      String groupId) async {
    try {
      final messages = await _messageRemoteService.getAllMessage(groupId);

      return DataSuccess(data: messages);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
