import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'app_theme.dart'; // Importe o tema que criamos

void main() {
  runApp(const DiaPeApp());
}

class DiaPeApp extends StatelessWidget {
  const DiaPeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Aplique o tema aqui
      home: SplashScreen(),
    );
  }
}
