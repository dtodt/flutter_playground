import 'package:flutter/material.dart';
import 'package:flutter_playground/src/excercises/imc/models/person_model.dart';

class ImcController {
  Widget calcBMI(double height, double weight) {
    return Text(PersonModel(height, weight).calcBMI.toStringAsFixed(2));
  }
}
