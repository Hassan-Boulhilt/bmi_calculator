import 'package:flutter/material.dart';

import 'const.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

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
      home: const CoreAppResultPage(title: 'BMI CALCULATOR'),
    );
  }
}

class CoreAppResultPage extends StatefulWidget {
  const CoreAppResultPage({
    super.key,
    this.title,
  });
  final String? title;

  @override
  State<CoreAppResultPage> createState() => _CoreAppResultPageState();
}

class _CoreAppResultPageState extends State<CoreAppResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
      ),
    );
  }
}
