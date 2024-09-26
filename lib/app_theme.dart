import 'package:flutter/material.dart';

class AppTheme {
  // Definindo o Tema do App com a paleta de cores
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFF8BBD0),
    scaffoldBackgroundColor: const Color(0xFFFCE4EC),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF48FB1),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF8BBD0),
      secondary: Color(0xFFF48FB1),
      background: Color(0xFFFCE4EC),
      onPrimary: Color(0xFF880E4F),
      onSecondary: Color(0xFFAD1457),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF880E4F)), // Atualizado
      bodyMedium: TextStyle(color: Color(0xFFAD1457)), // Atualizado
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFF48FB1), // Cor dos botões
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
