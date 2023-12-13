import 'dart:math';

class BMICalculator {
  final int weight;
  final int height;

  BMICalculator(this.weight, this.height);

  double getResultNumber() {
    return weight / pow(height / 100, 2);
  }

  String getResultTitle() {
    var bmi = getResultNumber();
    if (bmi > 25.0) {
      return 'OverWeight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultText() {
    var bmi = getResultNumber();
    if (bmi >= 25) {
      return 'Here are some general tips for managing overweight:\n1-Balanced Diet\n2-Regular Exercise\n3-Seek Professional Guidance\n4-Behavioral Changes\n5-Lifestyle Modifications';
    } else if (bmi >= 18.5) {
      return 'Hey, I just wanted to say congratulations on reaching and maintaining a healthy weight! Your dedication to your health is really inspiring. Keep up the great work!';
    } else {
      return 'Here are a few suggestions you can consider:\n1-Consult a healthcare professional\n2-Balanced diet\n3-Strength training\n4-Caloric surplus\n5-Healthy lifestyle habits';
    }
  }
}
