import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/login/domain/repository/auth_repository.dart';

class IsSignInUsecase extends UseCase<bool, void> {
  AuthRepository _authRepository;
  IsSignInUsecase(this._authRepository);

  @override
  Future<bool> call(void params) {
    return _authRepository.isSignIn();
  }
}
