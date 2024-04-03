import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telechat/core/constants/strings.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/group/data/models/user_model.dart';

abstract class UserService {
  Future<DataState<List<UserModel>, String>> getAllUser();
  Future<String> getCurrentUid();
}

class UserServiceImpl implements UserService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  UserServiceImpl(this._firestore, this._auth);
  @override
  Future<DataState<List<UserModel>, String>> getAllUser() async {
    try {
      final querrySnapshot = await _firestore.collection(userDocument).get();
      final users =
          querrySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      return DataSuccess(data: users);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  @override
  Future<String> getCurrentUid() async => _auth.currentUser!.uid;
}
