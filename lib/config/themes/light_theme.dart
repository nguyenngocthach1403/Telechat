import 'package:flutter/material.dart';
import 'package:telechat/core/constants/strings.dart';

class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      fontFamily: poppinsFont,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color(0xFF55A99C),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFD0ECE8),
          onPrimary: Color(0xFF55A99D),
          secondary: Color(0xFF878787),
          onSecondary: Color(0xFFE4E4E4),
          error: Color(0xFFCD6A6A),
          onError: Color(0xFFC53D3D),
          background: Color(0xFFFFFFFF),
          onBackground: Color(0xFFE4E4E4),
          surface: Color(0xFF040404),
          onSurface: Color(0xFF040404)),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColorLight: const Color(0x31363F),
      scaffoldBackgroundColor: const Color(0x31363F),
    );
  }
}
