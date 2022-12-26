import 'package:flutter/material.dart';

const _kStartColorInt = 0xFF316ada;
const _kStartColor = Color(_kStartColorInt);
const _kEndColorInt = 0xFF5648a5;
const _kEndColor = Color(_kEndColorInt);

const _kBluePurpleGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    _kStartColor,
    _kEndColor,
  ],
);

class C3LoginPage extends StatelessWidget {
  const C3LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final cardDivider = keyboardSize > 0 ? 2 : 3;
                  final spacerDivider = keyboardSize > 0 ? 2.8 : 2.3;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: constraints.maxHeight / spacerDivider),
                      LoginCard(size: constraints.maxHeight / cardDivider),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  final double size;

  const LoginCard({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size + 80.0,
      child: Stack(
        children: [
          Card(
            elevation: 5,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              height: size,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'LOGIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  const InputWidget(label: 'EMAIL'),
                  const SizedBox(height: 16.0),
                  const InputWidget(label: 'PASSWORD', secret: true),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: _kStartColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      height: 50.0,
                      child: const Center(
                          child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'FORGOT PASSWORD?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              gradient: _kBluePurpleGradient,
            ),
            child: const Center(
              child: LogoWidget(),
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(105.0),
        ),
        color: Colors.white,
      ),
      height: 105.0,
      width: 105.0,
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => _kBluePurpleGradient.createShader(
          bounds,
        ),
        child: const Icon(
          Icons.home,
          size: 60.0,
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final String label;
  final bool secret;

  const InputWidget({
    super.key,
    this.secret = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        floatingLabelStyle: const TextStyle(
          color: _kStartColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      obscureText: secret,
    );
  }
}
