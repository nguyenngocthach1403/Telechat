import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/core/resources/usecase.dart';
import 'package:telechat/features/group/domain/entities/group_entity.dart';
import 'package:telechat/features/group/domain/usecases/create_new_group_usecase.dart';
import 'package:telechat/features/group/domain/usecases/get_current_uid.dart';
import 'package:telechat/features/group/domain/usecases/get_my_group_usecase.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc(
    this._getMyGroupUsecase,
    this._getCurrentUID,
    this._createNewGroupUseCase,
  ) : super(GroupState(status: GroupStatus.initial)) {
    on<LoadGroup>(_loadMyGroup);
    on<CreateGroup>(_createNewGroup);
  }

  GetMyGroupUsecase _getMyGroupUsecase;
  GetCurrentUID _getCurrentUID;

  CreateNewGroupUseCase _createNewGroupUseCase;

  _createNewGroup(CreateGroup e, Emitter<GroupState> emit) async {
    emit(GroupState(status: GroupStatus.creating));
    final res = await _createNewGroupUseCase.call(e.newGroup);
    if (res is DataSuccess) {
      emit(GroupState(status: GroupStatus.created));
    } else {
      emit(GroupState(status: GroupStatus.createfailed, error: res.error));
    }
  }

  _loadMyGroup(LoadGroup e, Emitter<GroupState> emit) async {
    emit(GroupState(status: GroupStatus.loadding));

    final currentUid = await _getCurrentUID.call(NoParam());

    if (currentUid.isEmpty) return;

    final res = await _getMyGroupUsecase.call(currentUid);

    if (res is DataSuccess) {
      final groups = res.data;
      if (groups == null) {
        emit(GroupState(status: GroupStatus.loadfailed, error: 'Empty!'));
      }
      emit(GroupState(status: GroupStatus.loaded, groups: groups!));
    } else {
      emit(GroupState(status: GroupStatus.loadfailed, error: res.error));
    }
  }

  Future<List<GroupEntity>> loadGroup() async {
    final currentUid = await _getCurrentUID.call(NoParam());

    if (currentUid.isEmpty) return [];

    final res = await _getMyGroupUsecase.call(currentUid);

    if (res is DataSuccess) {
      final groups = res.data;
      if (groups == null) return [];
      return groups;
    } else {
      return [];
    }
  }
}
