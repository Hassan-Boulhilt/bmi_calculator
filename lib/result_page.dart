import 'package:flutter/material.dart';

import 'const.dart';
import 'helpers.dart';

class CoreAppResultPage extends StatelessWidget {
  const CoreAppResultPage(
      {super.key,
      required this.resultTitle,
      required this.resultNumber,
      required this.resultText});
  final String resultTitle;
  final double resultNumber;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: kYourResultTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: MyCardWidget(
                heightSize: double.infinity,
                couleur: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultTitle.toUpperCase(), style: kResultTextStyle),
                    Text(resultNumber.toStringAsFixed(1),
                        style: kBmiNumberResultStyle),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      child: Text(
                        resultText,
                        style: kBmiTextStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButtonBMI(
                buttonLable: 'RECALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
