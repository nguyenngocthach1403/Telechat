import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';

class GetMyGroupUsecase extends UseCase<Stream<List<GroupEntity>>, String> {
  GroupRepository _groupRepository;
  GetMyGroupUsecase(this._groupRepository);

  @override
  Future<Stream<List<GroupEntity>>> call(String params) {
    return _groupRepository.getMyGroup(params);
  }
}
