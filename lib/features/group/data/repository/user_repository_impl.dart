import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/group/data/models/group_model.dart';
import 'package:telechat/features/group/data/sources/remote/group_service.dart';
import 'package:telechat/features/group/data/sources/remote/user_sevice.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/entities/user_entity.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';

class GroupRepositoryImpl implements GroupRepository {
  UserService _userService;
  GroupRepositoryImpl(this._userService, this._groupService);
  GroupService _groupService;

  @override
  Future<DataState<List<UserEntity>, String>> getAllUser() {
    return _userService.getAllUser();
  }

  @override
  Future<String> getCurrentUID() {
    return _userService.getCurrentUid();
  }

  @override
  Future<DataState<List<GroupEntity>, String>> getMyGroup(String uid) async {
    try {
      final myGroupsId = await _groupService.getMyGroup(uid);
      final groups = await _groupService.getAllGroup();

      final List<GroupEntity> groupResult = [];
      for (var e in myGroupsId) {
        final res = getGroupById(e.groupId, groups);
        if (res != null) {
          groupResult.add(GroupEntity(
            groupId: res.groupId,
            groupImage: res.groupImage,
            groupName: res.groupName,
            members: res.members,
            newMessageNumber: e.newMessageNumber,
            recentMessage: res.recentMessage,
            recentTime: res.recentTime,
          ));
        }
      }

      return DataSuccess(data: groupResult);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }

  GroupModel? getGroupById(String gid, List<GroupModel> groups) {
    for (var group in groups) {
      if (group.groupId == gid) {
        return group;
      }
    }
    return null;
  }

  @override
  Future<DataState<bool, String>> createNewGroup(GroupEntity newGroup) async {
    try {
      // create new group
      final groupCreated = await _groupService.createGroup(newGroup);

      // update group of member
      for (var element in newGroup.members) {
        final groupsToUpdate = await _groupService.getMyGroup(element);
        groupsToUpdate.add(groupCreated);
        //update
        await _groupService.updateMyGroup(groupsToUpdate, element);
      }

      return DataSuccess(data: true);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
