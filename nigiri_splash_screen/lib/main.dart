import 'package:flutter/material.dart';
import 'package:nigiri_splash_screen/nigiri_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nigiri',
      home: const NagiriSplashScreen(),
    );
  }
}
