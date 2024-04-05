import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telechat/core/resources/get_date_time_by_timestamp.dart';
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
          recentTime: snapshot.get('recent_time') is String
              ? ''
              : getDatetimeByTimestamp(snapshot.get('recent_time')).toString(),
          members: List<String>.from(
              snapshot.get('members').map((e) => e.toString()).toList()),
        );

  GroupModel.fromSnapshotToMyGroup(DocumentSnapshot snapshot)
      : super(
          groupId: snapshot.get('gid'),
          groupName: snapshot.get('group_name'),
          groupImage: snapshot.get('group_image'),
          newMessageNumber: snapshot.get('new_message_number'),
          recentMessage: snapshot.get('recent_message'),
          recentTime: snapshot.get('recent_time') is String
              ? ''
              : dateTimeToString(getDatetimeByTimestamp(
                  (snapshot.get('recent_time') as Timestamp),
                )),
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
      'group_image': groupImage,
      'new_message_number': newMessageNumber,
      'recent_message': '',
      'recent_time': '',
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
