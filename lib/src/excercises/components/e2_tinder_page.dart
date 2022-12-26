import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class C2TinderPage extends StatelessWidget {
  const C2TinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Stack(
              children: const [
                BackButtonWidget(),
                Center(
                  child: LogoWidget(),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ActionPanelWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.chevron_left_rounded,
      color: Colors.white,
      size: 48.0,
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 255, 143, 120),
            Color.fromARGB(255, 241, 95, 119),
            Color.fromARGB(253, 241, 95, 119),
            Color.fromARGB(255, 246, 70, 100),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/tinder_logo.png',
          height: 48.0,
          width: 48.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          'tinder',
          style: GoogleFonts.robotoFlex(
            color: Colors.white,
            fontSize: 56.0,
            fontWeight: FontWeight.w600,
            letterSpacing: -1.0,
          ),
        ),
      ],
    );
  }
}

class ActionPanelWidget extends StatelessWidget {
  const ActionPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'By tapping Create Account or Sign In, you agree to our\n',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 11.0,
                fontWeight: FontWeight.normal,
              ),
              children: const [
                TextSpan(
                  text: 'Terms',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: '. Learn how we process your data in our ',
                ),
                TextSpan(
                  text: 'Privacy\nPolicy',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'Cookies Policy',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Button.primary(
            label: 'Sign in with Apple',
            icon: FontAwesomeIcons.apple,
          ),
          const SizedBox(height: 8.0),
          Button.primary(
            label: 'Sign in with Facebook',
            icon: FontAwesomeIcons.facebook,
          ),
          const SizedBox(height: 8.0),
          Button.primary(
            label: 'Sign in with Phone number',
            icon: FontAwesomeIcons.solidComment,
          ),
          const SizedBox(height: 8.0),
          Button.secondary(
            label: 'Trouble Signing In?',
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final bool border;
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;

  const Button({
    Key? key,
    this.icon,
    this.onTap,
    required this.border,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: border
              ? Border.all(
                  color: Colors.white,
                  width: 1.5,
                )
              : null,
          borderRadius: border
              ? const BorderRadius.all(
                  Radius.circular(50.0),
                )
              : null,
        ),
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              icon == null
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        icon!,
                        color: Colors.white,
                        size: 16.0,
                      )),
              Text(
                label,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: border ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  factory Button.primary({
    required String label,
    IconData? icon,
    VoidCallback? onTap,
  }) =>
      Button(
        border: true,
        icon: icon,
        label: label.toUpperCase(),
        onTap: onTap,
      );

  factory Button.secondary({
    required String label,
    VoidCallback? onTap,
  }) =>
      Button(
        border: false,
        label: label,
        onTap: onTap,
      );
}
