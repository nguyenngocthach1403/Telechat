import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/resources/data_state.dart';
import 'package:telechat/features/auth/domain/entities/user_entity.dart';
import 'package:telechat/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:telechat/features/auth/domain/usecase/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SigInUsecase _signInUsecase;
  SignUpUsecase _sinUpUsecase;
  AuthBloc(this._signInUsecase, this._sinUpUsecase) : super(AuthInitial()) {
    on<LoginEvent>(_loginWithEmailAndPassWord);
    on<SignUpEvent>(_signUp);
  }

  _loginWithEmailAndPassWord(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _signInUsecase
        .call(UserEntity(email: event.email, password: event.passWord));
    if (res is DataSuccess) {
      emit(AuthSuccess(user: res.data!));
    } else {
      emit(AuthFail(error: res.error!));
    }
  }

  _signUp(SignUpEvent e, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _sinUpUsecase.call(
        UserEntity(email: e.email, name: e.userName, password: e.password));

    if (res is DataSuccess) {
      emit(AuthSuccess(user: res.data!));
    } else {
      emit(AuthFail(error: res.error!));
    }
  }
}
