import 'package:flutter/material.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/controllers/cpf_controller.dart';

class CpfControllerPage extends StatefulWidget {
  const CpfControllerPage({super.key});

  @override
  State<CpfControllerPage> createState() => _CpfControllerPageState();
}

class _CpfControllerPageState extends State<CpfControllerPage> {
  final _controller = CpfController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPF Validator'),
      ),
      body: _controller.buildBody(
        onChanged: () => setState(() {}),
      ),
    );
  }
}
