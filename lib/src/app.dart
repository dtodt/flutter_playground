import 'package:flutter/material.dart';
import 'package:flutter_playground/src/challenges/c1_expense_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Playground',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: C1ExpensePage(),
    );
  }
}
