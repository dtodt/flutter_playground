import 'package:flutter/material.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/models/cpf_document.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/models/cpf_status.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_card_widget.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_input_widget.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_output_widget.dart';

const _duration = Duration(milliseconds: 500);

class CpfController {
  var _document = CpfDocument.empty();
  var _status = CpfStatus.initial;

  String? _error;
  bool _editing = false;

  Widget buildBody({required VoidCallback onChanged}) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DocumentCardWidget(
            color: _status.color,
            title: 'Controller',
            child: Center(
              child: AnimatedCrossFade(
                firstChild: DocumentOutputWidget(
                  document: _document.toStringWithFormat(),
                  onBackTap: () {
                    _clearStatus();
                    _editing = false;
                    onChanged();
                  },
                ),
                secondChild: DocumentIputWidget(
                  document: _document.value,
                  onCheck: (value) {
                    validateCpf(value);
                    _editing = true;
                    onChanged();
                  },
                ),
                crossFadeState: _editing
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: _duration,
              ),
            ),
          ),
          Visibility(
            visible: _error != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _error ?? '',
                style: TextStyle(color: _status.color),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _clearStatus() {
    _error = null;
    _status = CpfStatus.initial;
  }

  void validateCpf(String value) {
    _document = CpfDocument(value);
    _document.isValid().fold((_) {
      _error = null;
      _status = CpfStatus.valid;
    }, (failure) {
      _error = failure;
      _status = CpfStatus.invalid;
    });
  }
}
