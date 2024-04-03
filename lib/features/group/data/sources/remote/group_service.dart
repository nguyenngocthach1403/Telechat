import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telechat/core/constants/strings.dart';
import 'package:telechat/features/group/data/models/group_model.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';

abstract class GroupService {
  Future<List<GroupModel>> getMyGroup(String uid);
  Future<List<GroupModel>> getAllGroup();
  Future<GroupModel> createGroup(GroupEntity group);
  Future<void> updateMyGroup(List<GroupEntity> group, String uid);
}

class GroupServiceImpl implements GroupService {
  FirebaseFirestore _firestore;
  GroupServiceImpl(this._firestore);

  @override
  Future<GroupModel> createGroup(GroupEntity group) async {
    final doc = _firestore.collection(groupDocument).doc();
    //
    GroupModel newGroup = GroupModel(
      groupId: doc.id,
      groupName: group.groupName,
      groupImage: group.groupImage,
      members: group.members,
    );
    await _firestore
        .collection(groupDocument)
        .doc(doc.id)
        .set(newGroup.toMap());
    return GroupModel.fromSnapshot(
        await _firestore.collection(groupDocument).doc(doc.id).get());
  }

  @override
  Future<List<GroupModel>> getMyGroup(String uid) async {
    final querrySnapshot =
        await _firestore.collection(userDocument).doc(uid).get();
    final groups = querrySnapshot.get('groups');
    final List<GroupModel> myGroups = [];
    for (var element in groups) {
      myGroups.add(GroupModel.fromMapToMyGroup(
          gid: element['gid'],
          newMessageNumber: element['new_message_number']));
    }
    return myGroups;
  }

  @override
  Future<List<GroupModel>> getAllGroup() async {
    return await _firestore.collection(groupDocument).get().then(
        (value) => value.docs.map((e) => GroupModel.fromSnapshot(e)).toList());
  }

  @override
  Future<void> updateMyGroup(List<GroupEntity> group, String uid) async {
    final groupToUpdate =
        group.map((e) => GroupModel.fromGroupEntity(e)).toList();
    return await _firestore.collection(userDocument).doc(uid).update(
        {'groups': groupToUpdate.map((e) => e.toMyGroupDocument()).toList()});
  }
}
