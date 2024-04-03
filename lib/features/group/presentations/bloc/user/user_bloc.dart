import 'dart:async';
import 'dart:ffi';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/group/domain/entities/user_entity.dart';
import 'package:telechat/features/group/domain/usecases/get_all_user_usecase.dart';
import 'package:telechat/features/group/domain/usecases/get_current_uid.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._getAllUserUsecase, this._getCurrentUID)
      : super(UserInitial()) {
    on<LoadUserEvent>(_getAllUser);
  }

  GetAllUserUsecase _getAllUserUsecase;

  GetCurrentUID _getCurrentUID;
  Future _getAllUser(LoadUserEvent e, Emitter<UserState> emit) async {
    final res = await _getAllUserUsecase.call(Void);
    final currentUid = await _getCurrentUID.call(Void);
    if (res is DataSuccess) {
      emit(UserLoading());
      final users = res.data!;

      users.removeWhere((element) => element.uid == currentUid);
      emit(UserLoaded(users: users));
    } else {
      emit(UserFailed(error: res.error));
    }
  }
}
