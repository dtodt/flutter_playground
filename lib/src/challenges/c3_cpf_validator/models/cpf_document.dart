import 'package:flutter_playground/src/challenges/c3_cpf_validator/helpers/cpf_helper.dart';
import 'package:result_dart/result_dart.dart';

class CpfDocument {
  final String value;

  const CpfDocument(this.value);

  factory CpfDocument.empty() => const CpfDocument('');

  Result<Unit, String> isValid() {
    if (value.isEmpty) {
      return const Failure('Não pode ser vazio');
    }
    if (!isCpfValid(value)) {
      return const Failure('Documento inválido');
    }
    return Success.unit();
  }

  @override
  String toString() => value;

  String toStringWithFormat() => formatCpf(value);
}
