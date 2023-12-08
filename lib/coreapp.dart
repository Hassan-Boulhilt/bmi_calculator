import 'package:flutter/material.dart';

import 'const.dart';
import 'helpers.dart';
import 'result_page.dart';

class CoreAppHomePage extends StatefulWidget {
  const CoreAppHomePage({super.key, required this.title});
  final String title;

  @override
  State<CoreAppHomePage> createState() => _CoreAppHomePageState();
}

class _CoreAppHomePageState extends State<CoreAppHomePage> {
  double valueSlider = 180;
  bool selectedCardMale = false;
  bool selectedCardFemale = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCardFemale = false;
                          selectedCardMale = !selectedCardMale;
                        });
                      },
                      child: MyCardWidget(
                          heightSize: 160,
                          couleur: toggleColor(selectedCardMale),
                          cardChild: const ChildCardIconContent(
                              gender: 'MALE', icon: Icons.male)),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCardMale = false;
                          selectedCardFemale = !selectedCardFemale;
                        });
                      },
                      child: MyCardWidget(
                        heightSize: 160,
                        couleur: toggleColor(selectedCardFemale),
                        cardChild: const ChildCardIconContent(
                            gender: 'FEMALE', icon: Icons.female),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(children: [
              MyCardWidget(
                heightSize: 200,
                couleur: kActiveCardColor,
                cardChild: childCardSlider(),
              ),
            ]),
            const Row(children: [
              MyCardWidget(
                heightSize: 200,
                couleur: kActiveCardColor,
                cardChild: WeightAgeCounter(label: 'WEIGHT'),
              ),
              MyCardWidget(
                  heightSize: 200,
                  couleur: kActiveCardColor,
                  cardChild: WeightAgeCounter(label: 'AGE')),
            ]),
            GestureDetector(
              onTap: onPressed(),
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                color: kColorContainerPink,
                width: double.infinity,
                height: 80,
              ),
            )
          ]),
        ),
      ),
    );
  }

  onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CoreAppResultPage(),
      ),
    );
  }

  Column childCardSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'HEIGHT',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '${valueSlider.round()} ',
              style: kBigNumberStyle,
            ),
            const Text('cm', style: kLabelTextStyle),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              overlayColor: kSliderOverlayColor,
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
              activeTrackColor: kSliderActiveTrackColor,
              thumbColor: kColorContainerPink),
          child: Slider.adaptive(
            value: valueSlider,
            min: kMinValue,
            max: kMaxValue,
            onChanged: (double value) {
              setState(() {
                valueSlider = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
