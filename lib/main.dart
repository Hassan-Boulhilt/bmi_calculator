import 'package:flutter/material.dart';

import 'coreapp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0D22),
          shadowColor: Color(0xFF070918),
          elevation: 10,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
        sliderTheme: const SliderThemeData(
            trackHeight: 2,
            overlayColor: Color(0xFF31142F),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20)),
      ),
      home: const CoreApp(title: 'BMI CALCULATOR'),
    );
  }
}
