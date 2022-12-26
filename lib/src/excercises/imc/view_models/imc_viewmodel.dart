import 'package:flutter/material.dart';
import 'package:flutter_playground/src/excercises/imc/models/person_model.dart';

class ImcViewModel extends ChangeNotifier {
  var result = '0.00';

  void calcBMI(double height, double weight) {
    result = PersonModel(height, weight).calcBMI.toStringAsFixed(2);
    notifyListeners();
  }
}
