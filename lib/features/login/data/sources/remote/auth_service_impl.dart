import 'package:firebase_auth/firebase_auth.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/login/data/models/user_model.dart';
import 'package:telechat/features/login/domain/entities/user_entity.dart';

abstract class AuthService {
  Future<DataState<UserModel, FirebaseException>> loginWithEmailAndPassWord(
      {required UserEntity user});
  Future<DataState<UserModel, FirebaseException>> signUpWithEmailAndPassWord(
      {required UserEntity user});
  Future<bool> isSignIn();
}

class AuthServiceImpl extends AuthService {
  FirebaseAuth _auth;
  AuthServiceImpl(this._auth);

  @override
  Future<DataState<UserModel, FirebaseException>> loginWithEmailAndPassWord(
      {required UserEntity user}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return DataSuccess(
        data: UserModel(
          email: result.user!.email ?? '',
          uid: result.user!.uid,
        ),
      );
      // return DataSuccess(data: UserModel());
      // throw FirebaseException(plugin: '');
    } on FirebaseException catch (e) {
      return DataFailed(error: e);
    }
  }

  @override
  Future<DataState<UserModel, FirebaseException>> signUpWithEmailAndPassWord(
      {required UserEntity user}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      return DataSuccess(
        data: UserModel(
          email: result.user!.email ?? '',
          uid: result.user!.uid,
        ),
      );
    } on FirebaseException catch (e) {
      return DataFailed(error: e);
    }
  }

  @override
  Future<bool> isSignIn() async => _auth.currentUser?.uid != null;
}
