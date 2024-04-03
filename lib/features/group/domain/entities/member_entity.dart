// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String uid;
  final int newMessageNumber;
  const MemberEntity({
    this.uid = '',
    this.newMessageNumber = 0,
  });

  MemberEntity copyWith({
    String? uid,
    int? newMessageNumber,
  }) {
    return MemberEntity(
      uid: uid ?? this.uid,
      newMessageNumber: newMessageNumber ?? this.newMessageNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'newMessageNumber': newMessageNumber,
    };
  }

  factory MemberEntity.fromMap(Map<String, dynamic> map) {
    return MemberEntity(
      uid: map['uid'] as String,
      newMessageNumber: map['newMessageNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberEntity.fromJson(String source) =>
      MemberEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [uid, newMessageNumber];
}
