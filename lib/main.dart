import 'package:flutter/material.dart';
import 'package:telechat/config/themes/light_theme.dart';
import 'package:telechat/features/chat/presentations/views/chat_page.dart';

void main() {
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
      home: const ChatPage(),
    );
  }
}
