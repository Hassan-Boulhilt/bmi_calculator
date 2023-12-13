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
    return Container(
      margin: EdgeInsets.symmetric(vertical: marginSize!, horizontal: 4),
      width: double.infinity,
      height: heightSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: couleur,
      ),
      child: cardChild,
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

Color toggleColor(bool selectedCard) {
  return selectedCard ? kActiveCardColor : kInactiveCardColor;
}

class BottomButtonBMI extends StatelessWidget {
  const BottomButtonBMI({
    super.key,
    required this.onTap,
    required this.buttonLable,
  });
  final Function onTap;
  final String buttonLable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.only(bottom: 10),
          color: kColorContainerPink,
          width: double.infinity,
          height: 80,
          child: Center(
            child: Text(
              buttonLable,
              style: kTextStyleBottomPinkedContainer,
            ),
          )),
    );
  }
}

Route createRoute(Widget page) {
  return PageRouteBuilder(
    reverseTransitionDuration: const Duration(milliseconds: 500),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
