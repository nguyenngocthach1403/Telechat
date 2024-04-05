part of 'group_bloc.dart';

// ignore: must_be_immutable
class GroupState extends Equatable {
  GroupState({
    this.groups = const Stream.empty(),
    this.error,
    this.status = GroupStatus.initial,
  });
  Stream<List<GroupEntity>> groups;
  String? error;
  GroupStatus status;

  GroupState copyWith({
    final Stream<List<GroupEntity>>? groups,
    final String? error,
    final GroupStatus? status,
  }) {
    return GroupState(
      groups: groups ?? this.groups,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

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
