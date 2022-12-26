import 'package:flutter/material.dart';

enum CpfStatus {
  initial(Colors.blueGrey),
  invalid(Colors.deepOrangeAccent),
  valid(Colors.green);

  const CpfStatus(this.color);

  final Color color;
}
