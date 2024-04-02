import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/utils/widgets/loader.dart';
import 'package:telechat/core/utils/widgets/snackbar.dart';
import 'package:telechat/features/group/presentations/views/group_list_page.dart';
import 'package:telechat/features/login/presentation/bloc/auth/auth_bloc.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  @override
  void initState() {
    userFocusNode.addListener(_onFocus);
    super.initState();
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    super.dispose();
  }

  void _onFocus() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupListPage(),
            ),
          );
          showSnackBarr(context,
              color: Colors.green,
              title: 'Login Successfully',
              content: 'Account: ${state.user.email}');
        }
        if (state is AuthFail) {
          showSnackBarr(context,
              color: Colors.red,
              title: 'Login Failed',
              content: 'Error: ${state.error.message}');
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }
        return _buidBody();
      },
    ));
  }

  Widget _buidBody() {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // User name
              _buildUserNameTextBox(context),

              const SizedBox(
                height: 20,
              ),
              // Password
              _buildPasswordTextBox(context),

              const SizedBox(
                height: 20,
              ),
              // Button login
              _buildButtonLogin(
                context,
                press: () {
                  //
                  BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                      userNameController.text, passwordController.text));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameTextBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: userFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        focusNode: userFocusNode,
        controller: userNameController,
        decoration: const InputDecoration(
          hintText: 'Email',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordTextBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: passFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: passwordController,
        focusNode: passFocusNode,
        decoration: const InputDecoration(
          hintText: 'Password',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildButtonLogin(BuildContext context, {required Function() press}) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 140,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
