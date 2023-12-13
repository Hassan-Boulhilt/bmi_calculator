import 'package:flutter/material.dart';

import 'brainbmi.dart';
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
  double heightValue = 180;

  int weight = 60;
  int age = 20;
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
          child: Column(
            children: [
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
                Expanded(
                  child: MyCardWidget(
                    heightSize: 180,
                    couleur: kActiveCardColor,
                    cardChild: childCardSlider(),
                  ),
                ),
              ]),
              Row(children: [
                Expanded(
                  child: MyCardWidget(
                    heightSize: 180,
                    couleur: kActiveCardColor,
                    cardChild: Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight > 0 ? weight-- : weight = 0;
                                });
                              },
                              backgroundColor: kFloatingActionButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 16),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: kFloatingActionButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCardWidget(
                    heightSize: 180,
                    couleur: kActiveCardColor,
                    cardChild: Column(
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age > 0 ? age-- : age = 0;
                                });
                              },
                              backgroundColor: kFloatingActionButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 16),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor: kFloatingActionButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              BottomButtonBMI(
                buttonLable: 'CALCULATE',
                onTap: () {
                  BMICalculator bmi =
                      BMICalculator(weight, heightValue.toInt());
                  Navigator.push(
                    context,
                    createRoute(
                      CoreAppResultPage(
                        resultTitle: bmi.getResultTitle(),
                        resultNumber: bmi.getResultNumber(),
                        resultText: bmi.getResultText(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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
              '${heightValue.round()} ',
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
            value: heightValue,
            min: kMinValue,
            max: kMaxValue,
            onChanged: (double value) {
              setState(() {
                heightValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
