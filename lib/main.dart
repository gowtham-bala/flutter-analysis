import 'package:flutter/material.dart';
// Removed import of external login screen and provide a local placeholder
// to ensure `LoginScreen` is available. Replace with your actual
// implementation or restore the import when the class exists.

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance Dashboard',

      //dark theme
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(
          0xFF0F0F11,
        ), // Ultra dark background
        cardColor: const Color(0xFF18181C), // Slightly lighter for cards
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1A5CFF), // Vibrant Accent Blue
          secondary: Color(0xFF10B981), // Emerald Green
          surface: Color(0xFF18181C),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Color(0xFF94A3B8)), // Muted text gray
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
