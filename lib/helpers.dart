import 'package:flutter/material.dart';

import 'const.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({
    super.key,
    required this.heightSize,
    this.marginSize = 8,
    this.couleur = Colors.grey,
    this.cardChild,
  });
  final double? marginSize;
  final double heightSize;
  final Color couleur;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: marginSize!, horizontal: 4),
        width: double.infinity,
        height: heightSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: couleur,
        ),
        child: cardChild,
      ),
    );
  }
}

class ChildCardIconContent extends StatelessWidget {
  const ChildCardIconContent({
    super.key,
    required this.gender,
    required this.icon,
  });
  final String gender;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(height: 15),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

class WeightAgeCounter extends StatefulWidget {
  const WeightAgeCounter({
    super.key,
    required this.label,
  });
  final String label;

  @override
  State<WeightAgeCounter> createState() => _WeightAgeCounterState();
}

class _WeightAgeCounterState extends State<WeightAgeCounter> {
  int counter = 10;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        widget.label,
        style: kLabelTextStyle,
      ),
      Text(
        counter.toString(),
        style: kBigNumberStyle,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter > 0 ? counter-- : counter = 0;
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
                counter++;
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
    ]);
  }
}

Color toggleColor(bool selectedCard) {
  return selectedCard ? kActiveCardColor : kInactiveCardColor;
}
