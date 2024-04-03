// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String status;
  final String phoneNumber;
  final bool isOnline;
  final String gender;
  final String dob;
  final String profileUrl;
  const UserEntity({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.status = '',
    this.isOnline = false,
    this.gender = '',
    this.dob = '',
    this.profileUrl = '',
    this.phoneNumber = '',
  });

  UserEntity copyWith({
    String? uid,
    String? name,
    String? email,
    String? status,
    bool? isOnline,
    String? gender,
    String? dob,
    String? profileUrl,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      isOnline: isOnline ?? this.isOnline,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'status': status,
      'isOnline': isOnline,
      'gender': gender,
      'dob': dob,
      'profileUrl': profileUrl,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      status: map['status'] as String,
      isOnline: map['isOnline'] as bool,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      profileUrl: map['profileUrl'] as String,
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
      email,
      status,
      isOnline,
      gender,
      dob,
      profileUrl,
    ];
  }
}
