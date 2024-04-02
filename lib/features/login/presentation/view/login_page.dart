import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/features/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:telechat/features/login/presentation/widgets/login_body.dart';
import 'package:telechat/injection.container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const LoginBody(),
    );
  }
}
