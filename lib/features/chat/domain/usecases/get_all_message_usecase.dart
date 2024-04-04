import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/chat/domain/entities/message_entity.dart';
import 'package:telechat/features/chat/domain/repository/message_repository.dart';

class GetAllMessageUseCase
    extends UseCase<DataState<List<MessageEntity>, String>, String> {
  MessageRepository _messageRepository;
  GetAllMessageUseCase(this._messageRepository);
  @override
  Future<DataState<List<MessageEntity>, String>> call(String params) async {
    return await _messageRepository.getAllMessage(params);
  }
}
