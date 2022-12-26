import 'package:flutter/material.dart';
import 'package:flutter_playground/src/excercises/imc/controllers/imc_controller.dart';
import 'package:flutter_playground/src/excercises/imc/presenters/imc_presenter.dart';
import 'package:flutter_playground/src/excercises/imc/view_models/imc_viewmodel.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> implements ImcView {
  var height = 0.0;
  var weight = 0.0;

  final _controller = ImcController();
  final _viewModel = ImcViewModel();

  late final _presenter = ImcPresenter(this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                height = double.tryParse(value) ?? 0.0;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Altura',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                weight = double.tryParse(value) ?? 0.0;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Peso',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _presenter.calcBMI(height, weight);
                _viewModel.calcBMI(height, weight);
              },
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Controller:'),
                _controller.calcBMI(height, weight),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Presenter:'),
                Text(_presenter.result),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Viewmodel:'),
                AnimatedBuilder(
                  animation: _viewModel,
                  builder: (context, widget) {
                    return Text(_viewModel.result);
                  },
                ),
              ],
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
