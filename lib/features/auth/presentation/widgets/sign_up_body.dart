import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telechat/core/utils/widgets/loader.dart';
import 'package:telechat/core/utils/widgets/snackbar.dart';
import 'package:telechat/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:telechat/features/auth/presentation/view/login_page.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode userFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    userFocusNode.addListener(_onFocus);
    passFocusNode.addListener(_onFocus);
    emailFocusNode.addListener(_onFocus);
    super.initState();
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    passFocusNode.dispose();
    emailFocusNode.dispose();
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
          switch (state) {
            case AuthFail():
              {
                showSnackBarr(
                  context,
                  color: Colors.red,
                  content: state.error.message!,
                  title: 'Register Failed',
                );
              }
              break;
            case AuthSuccess():
              {
                showSnackBarr(
                  context,
                  color: Colors.green,
                  content: state.user.name,
                  title: 'Register Successfully',
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              }
              break;
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return _buidBody();
        },
      ),
    );
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

              //Emaill
              _buildEmailTextBox(context),

              const SizedBox(
                height: 20,
              ),
              // Password
              _buildPasswordTextBox(context),

              const SizedBox(
                height: 20,
              ),
              // Button login
              _buildButtonRegister(context, press: () {
                BlocProvider.of<AuthBloc>(context).add(
                  SignUpEvent(
                    emailController.text,
                    passwordController.text,
                    userNameController.text,
                  ),
                );
              }),
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
          hintText: 'Username',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildEmailTextBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: emailFocusNode.hasFocus
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        focusNode: emailFocusNode,
        controller: emailController,
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

  Widget _buildButtonRegister(BuildContext context,
      {required Function() press}) {
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
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }

  // void register() {

  // }
}
