import 'package:flutter_playground/src/excercises/imc/models/person_model.dart';

abstract class ImcView {
  void update();
}

class ImcPresenter {
  final ImcView view;

  var result = '0.00';

  ImcPresenter(this.view);

  void calcBMI(double height, double weight) {
    result = PersonModel(height, weight).calcBMI.toStringAsFixed(2);
    view.update();
  }
}
