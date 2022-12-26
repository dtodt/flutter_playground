import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final maskCpf = MaskTextInputFormatter(mask: '###.###.###-##', filter: {
  '#': RegExp(r'[0-9]'),
});

class DocumentIputWidget extends StatefulWidget {
  final String document;
  final ValueChanged<String> onCheck;

  const DocumentIputWidget({
    super.key,
    required this.document,
    required this.onCheck,
  });

  @override
  State<DocumentIputWidget> createState() => _DocumentIputWidgetState();
}

class _DocumentIputWidgetState extends State<DocumentIputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String document = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Enter your CPF',
                ),
                initialValue: document,
                inputFormatters: [maskCpf],
                onChanged: (value) => setState(() {
                  document = value;
                }),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () => widget.onCheck(document),
              child: const Text('Check'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    document = widget.document;
  }
}
