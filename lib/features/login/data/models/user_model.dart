// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telechat/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String uid;
  final String name;
  final String password;
  final String email;
  UserModel({
    this.uid = '',
    this.name = '',
    this.password = '',
    this.email = '',
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? password,
    String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'password': password,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, password: $password, email: $email)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.password == password &&
        other.email == email;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ password.hashCode ^ email.hashCode;
  }
}
