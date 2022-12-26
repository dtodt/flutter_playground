import 'package:flutter_playground/src/challenges/c3_cpf_validator/models/cpf_document.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/models/cpf_status.dart';

abstract class CpfView {
  void update();
}

class CpfPresenter {
  final CpfView view;

  var document = CpfDocument.empty();
  var status = CpfStatus.initial;

  String? error;

  CpfPresenter(this.view);

  void clearStatus() {
    error = null;
    status = CpfStatus.initial;

    view.update();
  }

  void validateCpf(String value) {
    document = CpfDocument(value);
    document.isValid().fold((_) {
      error = null;
      status = CpfStatus.valid;
    }, (failure) {
      error = failure;
      status = CpfStatus.invalid;
    });
    view.update();
  }
}
