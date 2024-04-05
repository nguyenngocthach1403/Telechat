import 'dart:ffi';

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

  GroupModel? getGroupById(String gid, List<GroupModel> groups) {
    for (var group in groups) {
      if (group.groupId == gid) {
        return group;
      }
    }
    return null;
  }

  @override
  Future<Stream<List<GroupEntity>>> getMyGroup(String uid) {
    return _groupService.getMyGroup(uid);
  }

  @override
  Future<DataState<void, String>> createGroup(GroupEntity groupToCreate) async {
    try {
      _groupService.createGroup(groupToCreate);
      return DataSuccess(data: Void);
    } catch (e) {
      return DataFailed(error: e.toString());
    }
  }
}
