import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/login/domain/entities/user_entity.dart';
import 'package:telechat/features/login/domain/usecase/is_sign_in_usecase.dart';
import 'package:telechat/features/login/domain/usecase/sign_in_usecase.dart';
import 'package:telechat/features/login/domain/usecase/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SigInUsecase _signInUsecase;
  SignUpUsecase _sinUpUsecase;
  IsSignInUsecase _isSingInUsecase;
  AuthBloc(this._signInUsecase, this._sinUpUsecase, this._isSingInUsecase)
      : super(AuthInitial()) {
    on<LoginEvent>(_loginWithEmailAndPassWord);
  }

  _loginWithEmailAndPassWord(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _signInUsecase
        .call(UserEntity(email: event.email, password: event.passWord));

    if (res is DataSuccess) {
      final isSign = await _isSingInUsecase.call(Void);
      if (isSign) {
        // final _updateOnlStatusUsercase.call(true);
        emit(AuthSuccess(user: res.data!));
      } else {
        emit(AuthFail(error: res.error!));
      }
    } else {
      emit(AuthFail(error: res.error!));
    }
  }
}
