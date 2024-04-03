import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';

class CreateNewGroupUseCase
    extends UseCase<DataState<bool, String>, GroupEntity> {
  GroupRepository _groupRepository;
  CreateNewGroupUseCase(this._groupRepository);

  @override
  Future<DataState<bool, String>> call(GroupEntity params) {
    return _groupRepository.createNewGroup(params);
  }
}
