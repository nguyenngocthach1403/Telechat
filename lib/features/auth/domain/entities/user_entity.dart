// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String password;
  final String email;
  final String profileUrl;
  final String gender;
  final bool isOnline;
  final String status;
  final String dob;
  const UserEntity({
    this.uid = '',
    this.name = '',
    this.password = '',
    this.email = '',
    this.profileUrl = '',
    this.gender = '',
    this.isOnline = false,
    this.status = '',
    this.dob = '',
  });

  UserEntity copyWith({
    String? uid,
    String? name,
    String? password,
    String? email,
    String? profileUrl,
    String? gender,
    bool? isOnline,
    String? status,
    String? dob,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      gender: gender ?? this.gender,
      isOnline: isOnline ?? this.isOnline,
      status: status ?? this.status,
      dob: dob ?? this.dob,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'password': password,
      'email': email,
      'profileUrl': profileUrl,
      'gender': gender,
      'isOnline': isOnline,
      'status': status,
      'dob': dob,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      profileUrl: map['profileUrl'] as String,
      gender: map['gender'] as String,
      isOnline: map['isOnline'] as bool,
      status: map['status'] as String,
      dob: map['dob'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      uid,
      name,
      password,
      email,
      profileUrl,
      gender,
      isOnline,
      status,
      dob,
    ];
  }
}
