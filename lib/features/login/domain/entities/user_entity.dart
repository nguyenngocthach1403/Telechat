// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String password;
  final String email;
  const UserEntity({
    this.uid = '',
    this.name = '',
    this.password = '',
    this.email = '',
  });

  UserEntity copyWith({
    String? uid,
    String? name,
    String? password,
    String? email,
  }) {
    return UserEntity(
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

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [uid, name, password, email];
}
