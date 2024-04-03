import 'dart:convert';

import 'package:telechat/features/group/domain/entities/member_entity.dart';

class MemberModel extends MemberEntity {
  const MemberModel({
    final String uid = '',
    final int newMessageNumber = 0,
  }) : super(
          uid: uid,
          newMessageNumber: newMessageNumber,
        );

  MemberModel.fromMap(Map<String, dynamic> map)
      : super(
          uid: map['uid'] ?? '',
          newMessageNumber: map['new_message_number'] as int,
        );
  factory MemberModel.fromJson(String json) =>
      MemberModel.fromMap(jsonDecode(json));

  @override
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      'new_message_number': newMessageNumber,
    };
  }
}
