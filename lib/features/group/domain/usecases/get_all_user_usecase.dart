import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/group/domain/entities/user_entity.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';

class GetAllUserUsecase
    extends UseCase<DataState<List<UserEntity>, String>, void> {
  GroupRepository _userRepository;
  GetAllUserUsecase(this._userRepository);
  @override
  Future<DataState<List<UserEntity>, String>> call(void params) {
    return _userRepository.getAllUser();
  }
}
