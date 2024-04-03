import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';

class GetMyGroupUsecase
    extends UseCase<DataState<List<GroupEntity>, String>, String> {
  GroupRepository _groupRepository;
  GetMyGroupUsecase(this._groupRepository);

  @override
  Future<DataState<List<GroupEntity>, String>> call(String params) {
    return _groupRepository.getMyGroup(params);
  }
}
