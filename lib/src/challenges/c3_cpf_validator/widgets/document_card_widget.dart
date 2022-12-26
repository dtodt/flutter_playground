import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 500);

class DocumentCardWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final String title;

  const DocumentCardWidget({
    super.key,
    required this.child,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      height: 200.0,
      width: 300.0,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [
            color,
            color.withAlpha(50),
            color.withAlpha(30),
            color.withAlpha(10),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50.0,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black54,
                    ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: _duration,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
