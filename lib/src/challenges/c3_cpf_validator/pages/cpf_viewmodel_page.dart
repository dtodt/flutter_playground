import 'package:flutter/material.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/viewmodels/cpf_viewmodel.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_card_widget.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_input_widget.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_output_widget.dart';

const _duration = Duration(milliseconds: 500);

class CpfViewModelPage extends StatefulWidget {
  const CpfViewModelPage({super.key});

  @override
  State<CpfViewModelPage> createState() => _CpfViewModelPageState();
}

class _CpfViewModelPageState extends State<CpfViewModelPage> {
  final _viewModel = CpfViewModel();

  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPF Validator'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _viewModel,
          builder: (context, widget) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DocumentCardWidget(
                  color: _viewModel.status.color,
                  title: 'Viewmodel',
                  child: Center(
                    child: AnimatedCrossFade(
                      firstChild: DocumentOutputWidget(
                        document: _viewModel.document.toStringWithFormat(),
                        onBackTap: () => setState(() {
                          _viewModel.clearStatus();
                          _editing = false;
                        }),
                      ),
                      secondChild: DocumentIputWidget(
                        document: _viewModel.document.value,
                        onCheck: (value) {
                          _viewModel.validateCpf(value);
                          setState(() {
                            _editing = true;
                          });
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
                  visible: _viewModel.error != null,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _viewModel.error ?? '',
                      style: TextStyle(color: _viewModel.status.color),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
