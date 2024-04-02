import 'package:firebase_core/firebase_core.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/login/data/models/user_model.dart';
import 'package:telechat/features/login/data/sources/remote/auth_service_impl.dart';
import 'package:telechat/features/login/domain/entities/user_entity.dart';
import 'package:telechat/features/login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthServiceImpl _authServiceImpl;
  AuthRepositoryImpl(this._authServiceImpl);

  @override
  Future<DataState<UserModel, FirebaseException>> registerWithEmailAndPassword(
      {required UserEntity user}) {
    return _authServiceImpl.signUpWithEmailAndPassWord(user: user);
  }

  @override
  Future<DataState<UserEntity, FirebaseException>> sigInWithEmailAndPassword(
      {required UserEntity user}) {
    return _authServiceImpl.loginWithEmailAndPassWord(user: user);
  }

  @override
  Future<bool> isSignIn() {
    return _authServiceImpl.isSignIn();
  }
}
