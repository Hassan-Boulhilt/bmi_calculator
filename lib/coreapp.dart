import 'package:flutter/material.dart';

import 'const.dart';
import 'helpers.dart';

class CoreApp extends StatefulWidget {
  const CoreApp({super.key, required this.title});
  final String title;

  @override
  State<CoreApp> createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  double valueSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(
                children: [
                  MyCardWidget(
                      heightSize: 160,
                      couleur: couleur,
                      cardChild: ChildCardIconContent(
                          genre: 'MALE', icon: Icons.male)),
                  MyCardWidget(
                    heightSize: 160,
                    couleur: couleur,
                    cardChild: ChildCardIconContent(
                        genre: 'FEMALE', icon: Icons.female),
                  ),
                ],
              ),
            ),
            Row(children: [
              MyCardWidget(
                heightSize: 200,
                couleur: couleur,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(color: couleurCardChilds, fontSize: 16),
                    ),
                    Text(
                      '${valueSlider.round()}',
                      style: const TextStyle(
                          // color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 60),
                    ),
                    Slider.adaptive(
                      value: valueSlider,
                      max: 220.0,
                      activeColor: colorContainerPink,
                      onChanged: (double value) {
                        setState(() {
                          valueSlider = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ]),
            const Row(children: [
              MyCardWidget(heightSize: 200, couleur: couleur),
              MyCardWidget(heightSize: 200, couleur: couleur),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 8),
              color: colorContainerPink,
              width: double.infinity,
              height: 80,
            )
          ]),
        ),
      ),
    );
  }
}
