part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();

  @override
  List<Object> get props => [];
}

class LoadGroup extends GroupEvent {
  const LoadGroup();
}

class CreateGroup extends GroupEvent {
  final GroupEntity newGroup;
  const CreateGroup(this.newGroup);
}
