// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GroupEntity extends Equatable {
  final String groupId;
  final String groupName;
  final String recentMessage;
  final int newMessageNumber;
  final String recentTime;
  final String groupImage;
  final List<String> members;
  const GroupEntity({
    this.groupId = '',
    this.groupName = '',
    this.recentMessage = '',
    this.newMessageNumber = 0,
    this.recentTime = '',
    this.groupImage = '',
    this.members = const [],
  });

  GroupEntity copyWith({
    String? groupId,
    String? groupName,
    String? recentMessage,
    int? newMessageNumber,
    String? recentTime,
    String? groupImage,
    List<String>? members,
  }) {
    return GroupEntity(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      recentMessage: recentMessage ?? this.recentMessage,
      newMessageNumber: newMessageNumber ?? this.newMessageNumber,
      recentTime: recentTime ?? this.recentTime,
      groupImage: groupImage ?? this.groupImage,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gid': groupId,
      'group_name': groupName,
      'recent_message': recentMessage,
      'recent_time': recentTime,
      'group_image': groupImage,
      'members': members,
    };
  }

  factory GroupEntity.fromMap(Map<String, dynamic> map) {
    return GroupEntity(
        groupId: map['gid'] as String,
        groupName: map['group_name'] as String,
        recentMessage: map['recent_message'] as String,
        newMessageNumber: map['new_message_number'] as int,
        recentTime: map['recent_time'] as String,
        groupImage: map['group_image'] as String,
        members: List<String>.from(
          (map['members'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory GroupEntity.fromJson(String source) =>
      GroupEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      groupId,
      groupName,
      recentMessage,
      newMessageNumber,
      recentTime,
      groupImage,
      members,
    ];
  }
}
