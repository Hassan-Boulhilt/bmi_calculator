import 'package:flutter/material.dart';

import 'const.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget(
      {super.key,
      required this.heightSize,
      this.marginSize = 8,
      this.couleur = Colors.grey,
      this.cardChild});
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
    required this.genre,
    required this.icon,
  });
  final String genre;
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
        const Text(
          'MALE',
          style: TextStyle(fontSize: 18, color: couleurCardChilds),
        )
      ],
    );
  }
}
