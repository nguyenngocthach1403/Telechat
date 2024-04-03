import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/entities/user_entity.dart';

abstract class GroupRepository {
  Future<DataState<List<UserEntity>, String>> getAllUser();
  Future<String> getCurrentUID();

  Future<DataState<List<GroupEntity>, String>> getMyGroup(String uid);

  Future<DataState<bool, String>> createNewGroup(GroupEntity newGroup);
}
