import 'package:flutter/material.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/models/cpf_document.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/models/cpf_status.dart';

class CpfViewModel extends ChangeNotifier {
  var document = CpfDocument.empty();
  var status = CpfStatus.initial;

  String? error;

  void clearStatus() {
    error = null;
    status = CpfStatus.initial;

    notifyListeners();
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
    notifyListeners();
  }
}
