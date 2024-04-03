import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/features/group/presentations/bloc/group/group_bloc.dart';
import 'package:telechat/features/group/presentations/bloc/user/user_bloc.dart';
import 'package:telechat/features/group/presentations/widgets/group_list_body.dart';
import 'package:telechat/injection.container.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<UserBloc>()..add(const LoadUserEvent())),
        BlocProvider(
          create: (context) => sl<GroupBloc>()..add(const LoadGroup()),
        ),
      ],
      child: const GroupListBody(),
    );
  }
}
