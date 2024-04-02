import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telechat/config/themes/light_theme.dart';
import 'package:telechat/features/login/presentation/view/login_page.dart';
import 'package:telechat/firebase_options.dart';
import 'package:telechat/injection.container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      home: const LoginPage(),
    );
  }
}
