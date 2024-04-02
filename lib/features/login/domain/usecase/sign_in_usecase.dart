import 'package:firebase_core/firebase_core.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/login/domain/entities/user_entity.dart';
import 'package:telechat/features/login/domain/repository/auth_repository.dart';

class SigInUsecase
    extends UseCase<DataState<UserEntity, FirebaseException>, UserEntity> {
  AuthRepository _authRepository;
  SigInUsecase(this._authRepository);

  @override
  Future<DataState<UserEntity, FirebaseException>> call(
      UserEntity params) async {
    return await _authRepository.sigInWithEmailAndPassword(user: params);
  }
}
