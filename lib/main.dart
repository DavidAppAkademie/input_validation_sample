import 'package:flutter/material.dart';
import 'package:input_validation_sample/validation_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen)),
      home: ValidationScreen(),
    );
  }
}
