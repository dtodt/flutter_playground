import 'package:flutter/material.dart';

class DocumentOutputWidget extends StatelessWidget {
  final String document;
  final VoidCallback onBackTap;

  const DocumentOutputWidget(
      {super.key, required this.document, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 12.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                document,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.black87,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: onBackTap,
            child: const Icon(Icons.keyboard_arrow_left_rounded),
          ),
        ],
      ),
    );
  }
}
