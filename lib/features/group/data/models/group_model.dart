import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';

class GroupModel extends GroupEntity {
  GroupModel({
    final String groupId = '',
    final String groupName = '',
    final String recentMessage = '',
    final String recentTime = '',
    final String groupImage = '',
    final List<String> members = const [],
  }) : super(
          groupId: groupId,
          groupName: groupName,
          recentMessage: recentMessage,
          recentTime: recentTime,
          groupImage: groupImage,
          members: members,
        );

  GroupModel.fromSnapshot(DocumentSnapshot snapshot)
      : super(
          groupId: snapshot.get("gid"),
          groupName: snapshot.get('group_name'),
          groupImage: snapshot.get('group_image'),
          recentMessage: snapshot.get('recent_message'),
          recentTime: snapshot.get('recent_time'),
          members: List<String>.from(
              snapshot.get('members').map((e) => e.toString()).toList()),
        );

  GroupModel.fromMapToMyGroup({String gid = '', int newMessageNumber = 0})
      : super(
          groupId: gid,
          newMessageNumber: newMessageNumber,
        );

  Map<String, dynamic> toDocument() {
    return {
      'gid': groupId,
      'group_name': groupName,
      'recent_time': recentTime,
      'recent_message': recentMessage,
      'group_image': groupImage,
      'members': members,
    };
  }

  Map<String, dynamic> toMyGroupDocument() {
    return {
      'gid': groupId,
      'group_name': groupName,
      'new_message_number': newMessageNumber,
    };
  }

  factory GroupModel.fromGroupEntity(GroupEntity entity) => GroupModel(
        groupId: entity.groupId,
        groupImage: entity.groupImage,
        groupName: entity.groupName,
        members: entity.members,
        recentMessage: entity.recentMessage,
        recentTime: entity.recentTime,
      );
}
