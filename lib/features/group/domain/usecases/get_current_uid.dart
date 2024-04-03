import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';

class GetCurrentUID extends UseCase<String, void> {
  GroupRepository _userRepository;
  GetCurrentUID(this._userRepository);

  @override
  Future<String> call(void params) {
    return _userRepository.getCurrentUID();
  }
}
