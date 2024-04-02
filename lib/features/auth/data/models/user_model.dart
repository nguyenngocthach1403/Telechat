// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telechat/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    final String? uid,
    final String? name,
    final String? password,
    final String? email,
    final String? profileUrl,
    final String? gender,
    final bool? isOnline,
    final String? status,
    final String? dob,
  }) : super(
          uid: uid ?? '',
          email: email ?? '',
          dob: dob ?? '',
          gender: gender ?? '',
          isOnline: isOnline ?? false,
          name: name ?? '',
          password: '',
          profileUrl: profileUrl ?? '',
        );

  UserModel copyWith({
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
    return UserModel(
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
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

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, password: $password, email: $email, profileUrl: $profileUrl, gender: $gender, isOnline: $isOnline, status: $status, dob: $dob)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.password == password &&
        other.email == email &&
        other.profileUrl == profileUrl &&
        other.gender == gender &&
        other.isOnline == isOnline &&
        other.status == status &&
        other.dob == dob;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        password.hashCode ^
        email.hashCode ^
        profileUrl.hashCode ^
        gender.hashCode ^
        isOnline.hashCode ^
        status.hashCode ^
        dob.hashCode;
  }
}
