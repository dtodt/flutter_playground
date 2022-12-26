import 'dart:math';

//
class PersonModel {
  final double height;
  final double weight;

  const PersonModel(this.height, this.weight);

  double get calcBMI => weight / max(pow(height, 2), 1.0);
}
