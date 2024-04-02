import 'package:firebase_core/firebase_core.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/auth/data/models/user_model.dart';
import 'package:telechat/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity, FirebaseException>> sigInWithEmailAndPassword(
      {required UserEntity user});
  Future<DataState<UserModel, FirebaseException>> registerWithEmailAndPassword(
      {required UserEntity user});
}
