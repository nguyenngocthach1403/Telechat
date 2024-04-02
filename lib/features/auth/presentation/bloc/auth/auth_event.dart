part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String passWord;
  const LoginEvent(this.email, this.passWord);
}

class SignUpEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const SignUpEvent(this.email, this.password, this.userName);
}
