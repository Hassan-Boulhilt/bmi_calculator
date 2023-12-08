import 'package:flutter/material.dart';

import 'const.dart';
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
          backgroundColor: kAppBarColor,
          shadowColor: kAppBarShadowColor,
          elevation: 10,
        ),
        scaffoldBackgroundColor: kScafoldbackgroundCol,
      ),
      home: const CoreAppHomePage(title: 'BMI CALCULATOR'),
    );
  }
}
