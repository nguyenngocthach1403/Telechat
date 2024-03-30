import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      primaryColorDark: const Color(0x31363F),
      scaffoldBackgroundColor: const Color(0x31363F),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xD0ECE8),
          onPrimary: Color(0x55A99D),
          secondary: Color(0xE4E4E4),
          onSecondary: Colors.black,
          error: Color(0xCD6A6A),
          onError: Color(0xC53D3D),
          background: Color(0xFFFFFF),
          onBackground: Color(0xE4E4E4),
          surface: Color(0x040404),
          onSurface: Color(0x040404)),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColorLight: const Color(0x31363F),
      scaffoldBackgroundColor: const Color(0x31363F),
    );
  }
}
