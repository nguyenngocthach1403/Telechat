part of 'group_bloc.dart';

// ignore: must_be_immutable
class GroupState extends Equatable {
  GroupState({
    this.groups = const [],
    this.error,
    this.status = GroupStatus.initial,
  });
  List<GroupEntity> groups;
  String? error;
  GroupStatus status;

  @override
  List<Object?> get props => [groups, status, error];
}

enum GroupStatus {
  initial,
  loadding,
  loaded,
  creating,
  created,
  loadfailed,
  createfailed
}
