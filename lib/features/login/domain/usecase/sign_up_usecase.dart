import 'package:firebase_core/firebase_core.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/login/data/models/user_model.dart';
import 'package:telechat/features/login/domain/repository/auth_repository.dart';

class SignUpUsecase
    implements UseCase<DataState<UserModel, FirebaseException>, UserModel> {
  AuthRepository _authRepository;
  SignUpUsecase(this._authRepository);

  @override
  Future<DataState<UserModel, FirebaseException>> call(UserModel params) {
    return _authRepository.registerWithEmailAndPassword(user: params);
  }
}
