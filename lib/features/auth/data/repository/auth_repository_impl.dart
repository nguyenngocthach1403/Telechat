import 'package:firebase_core/firebase_core.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/auth/data/models/user_model.dart';
import 'package:telechat/features/auth/data/sources/remote/auth_service_impl.dart';
import 'package:telechat/features/auth/domain/entities/user_entity.dart';
import 'package:telechat/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService _authService;
  AuthRepositoryImpl(this._authService);

  @override
  Future<DataState<UserModel, FirebaseException>> registerWithEmailAndPassword(
      {required UserEntity user}) {
    return _authService.signUpWithEmailAndPassWord(user: user);
  }

  @override
  Future<DataState<UserEntity, FirebaseException>> sigInWithEmailAndPassword(
      {required UserEntity user}) {
    return _authService.loginWithEmailAndPassWord(user: user);
  }
}
