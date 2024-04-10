import 'dart:async';

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
    on<CreateGroup>(_createGroup);
  }

  GetMyGroupUsecase _getMyGroupUsecase;
  GetCurrentUID _getCurrentUID;

  CreateNewGroupUseCase _createNewGroupUseCase;

  _createGroup(CreateGroup e, Emitter<GroupState> emit) async {
    //Creating state
    emit(state.copyWith(status: GroupStatus.creating));

    final res = await _createNewGroupUseCase.call(e.newGroup);

    //check successfully
    if (res is DataSuccess) {
      emit(state.copyWith(
        status: GroupStatus.created,
      ));
    } else {
      emit(state.copyWith(status: GroupStatus.createfailed, error: res.error));
    }
  }

  _loadMyGroup(LoadGroup e, Emitter<GroupState> emit) async {
    //Loading state
    emit(state.copyWith(status: GroupStatus.loadding));

    //Get current uid
    final currentUid = await _getCurrentUID(NoParam());

    //have not any about current user
    if (currentUid.isEmpty) {
      //Load failed
      emit(state.copyWith(
          status: GroupStatus.loadfailed, error: 'Not found user to load!'));
    }

    //Get Stream load group
    final groupStream = await _getMyGroupUsecase.call(currentUid);

    //load Successfully
    emit(state.copyWith(
      groups: groupStream,
      status: GroupStatus.loaded,
    ));
  }
}
