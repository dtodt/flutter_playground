import 'package:flutter/material.dart';
import 'package:flutter_playground/src/excercises/animations/e2_implicit_expansion_tile.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Playground',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: E2ImplicitExpansionTile(),
    );
  }
}
