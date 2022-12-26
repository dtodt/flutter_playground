import 'package:flutter/material.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/presenters/cpf_presenter.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_card_widget.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_input_widget.dart';
import 'package:flutter_playground/src/challenges/c3_cpf_validator/widgets/document_output_widget.dart';

const _duration = Duration(milliseconds: 500);

class CpfPresenterPage extends StatefulWidget {
  const CpfPresenterPage({super.key});

  @override
  State<CpfPresenterPage> createState() => _CpfPresenterPageState();
}

class _CpfPresenterPageState extends State<CpfPresenterPage>
    implements CpfView {
  late final _presenter = CpfPresenter(this);

  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPF Validator'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DocumentCardWidget(
              color: _presenter.status.color,
              title: 'Presenter',
              child: Center(
                child: AnimatedCrossFade(
                  firstChild: DocumentOutputWidget(
                    document: _presenter.document.toStringWithFormat(),
                    onBackTap: () => setState(() {
                      _presenter.clearStatus();
                      _editing = false;
                    }),
                  ),
                  secondChild: DocumentIputWidget(
                    document: _presenter.document.value,
                    onCheck: (value) {
                      _presenter.validateCpf(value);
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
              visible: _presenter.error != null,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _presenter.error ?? '',
                  style: TextStyle(color: _presenter.status.color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void update() {
    setState(() {});
  }
}
