part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState({
    this.users = const [],
    this.error,
  });
  final List<UserEntity> users;
  final String? error;
  @override
  List<Object?> get props => [users, error];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  const UserLoaded({super.users});
}

class UserFailed extends UserState {
  const UserFailed({super.error});
}
