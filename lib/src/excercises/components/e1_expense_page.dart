import 'package:flutter/material.dart';

const _kSpacerDouble = 16.0;
const _kPurpleColorInt = 0xFF5e5ce5;
const _kPurpleColor = Color(_kPurpleColorInt);
const _kLogoRadiusDouble = 100.0;

const _kTitleLabel = 'Get your Money\nUnder Control';
const _kSubTitleLabel = 'Manage your expenses.\nSeamlessly';
const _kSignUpEmailLabel = 'Sign Up with Email ID';
const _kSignUpGoogleLabel = 'Sign Up with Google';
const _kSignInLabel = 'Already have an account? ';
const _kSignInUnderlineLabel = 'Sign In';

class C1ExpensePage extends StatelessWidget {
  const C1ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(_kSpacerDouble),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    LogoWidget(size: _kLogoRadiusDouble),
                    SizedBox(height: 48.0),
                    TitleWidget(),
                    SizedBox(height: 24.0),
                    SubTitleWidget(),
                  ],
                ),
              ),
              ButtonWidget.primary(
                label: _kSignUpEmailLabel,
                onTap: () {},
              ),
              const SizedBox(height: _kSpacerDouble),
              ButtonWidget.secondary(
                icon: Image.asset(
                  'images/google_logo.png',
                  height: 24.0,
                  width: 24.0,
                ),
                label: _kSignUpGoogleLabel,
                onTap: () {},
              ),
              const SizedBox(height: _kSpacerDouble),
              SignInButtonWidget(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  final double size;

  const LogoWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: _kPurpleColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(_kLogoRadiusDouble),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: _kPurpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(_kLogoRadiusDouble),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: _kPurpleColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_kLogoRadiusDouble),
                  bottomLeft: Radius.circular(_kLogoRadiusDouble),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      _kTitleLabel,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      _kSubTitleLabel,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 22,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final Color? color;
  final Widget? icon;
  final Widget label;
  final VoidCallback? onTap;

  const ButtonWidget({
    Key? key,
    this.color,
    this.icon,
    this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        height: 50.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            SizedBox(width: icon != null ? 8.0 : 0.0),
            label,
          ],
        ),
      ),
    );
  }

  factory ButtonWidget.primary({
    required String label,
    Widget? icon,
    VoidCallback? onTap,
  }) =>
      ButtonWidget(
        color: _kPurpleColor,
        icon: icon,
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      );

  factory ButtonWidget.secondary({
    required String label,
    Widget? icon,
    VoidCallback? onTap,
  }) =>
      ButtonWidget(
        icon: icon,
        color: Colors.white,
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      );
}

class SignInButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const SignInButtonWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: onTap,
      label: RichText(
        text: const TextSpan(
          text: _kSignInLabel,
          style: TextStyle(
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: _kSignInUnderlineLabel,
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
