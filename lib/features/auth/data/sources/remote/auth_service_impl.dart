import 'package:firebase_auth/firebase_auth.dart';
import 'package:telechat/core/constants/strings.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/auth/data/models/user_model.dart';
import 'package:telechat/features/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthService {
  Future<DataState<UserModel, FirebaseException>> loginWithEmailAndPassWord(
      {required UserEntity user});
  Future<DataState<UserModel, FirebaseException>> signUpWithEmailAndPassWord(
      {required UserEntity user});

  Future<void> createUserDocument({required UserEntity user});
}

class AuthServiceImpl extends AuthService {
  FirebaseAuth _auth;
  FirebaseFirestore _firestore;
  AuthServiceImpl(this._auth, this._firestore);

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
      await createUserDocument(user: user.copyWith(uid: result.user!.uid));
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
  Future<void> createUserDocument({required UserEntity user}) async {
    await _firestore.collection(userDocument).doc(user.uid).set({
      "uid": user.uid,
      "name": user.name,
      "email": user.email,
      "gender": user.gender,
      "is_online": user.isOnline,
      "dob": user.dob,
      "status": user.status
    });
  }
}
