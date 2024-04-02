import 'package:firebase_core/firebase_core.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/auth/data/models/user_model.dart';
import 'package:telechat/features/auth/domain/entities/user_entity.dart';
import 'package:telechat/features/auth/domain/repository/auth_repository.dart';

class SignUpUsecase
    implements UseCase<DataState<UserModel, FirebaseException>, UserModel> {
  AuthRepository _authRepository;
  SignUpUsecase(this._authRepository);

  @override
  Future<DataState<UserModel, FirebaseException>> call(UserEntity params) {
    return _authRepository.registerWithEmailAndPassword(user: params);
  }
}
