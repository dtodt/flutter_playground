import 'package:flutter/material.dart';

const _kDefaultExecutionTime = Duration(seconds: 1);

///
abstract class Shape {
  final double borderRadius;
  final Color color;
  final double height;
  final double width;

  const Shape({
    required this.borderRadius,
    required this.color,
    required this.height,
    required this.width,
  });
}

///
class Circle extends Shape {
  const Circle({
    required double size,
    required Color color,
  }) : super(borderRadius: size / 2, color: color, height: size, width: size);

  factory Circle.blue() => const Circle(color: Colors.blue, size: 50.0);
}

///
class Rectangle extends Shape {
  const Rectangle({
    required Color color,
    required double height,
    required double width,
  }) : super(borderRadius: 0.0, color: color, height: height, width: width);

  factory Rectangle.green() => const Rectangle(
        color: Colors.green,
        height: 50.0,
        width: 100.0,
      );
}

///
class E1ImplicitFab extends StatefulWidget {
  const E1ImplicitFab({super.key});

  @override
  State<E1ImplicitFab> createState() => _E1ImplicitFabState();
}

class _E1ImplicitFabState extends State<E1ImplicitFab> {
  AlignmentGeometry alignment = Alignment.bottomRight;
  Shape shape = Circle.blue();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: alignment,
                curve: Curves.easeInOutCirc,
                duration: _kDefaultExecutionTime,
                child: ImplicitFab(
                  shape: shape,
                  onTap: _onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() => setState(() {
        if (shape is Rectangle) {
          alignment = Alignment.bottomRight;
          shape = Circle.blue();
        } else {
          alignment = Alignment.topCenter;
          shape = Rectangle.green();
        }
      });
}

class ImplicitFab extends StatelessWidget {
  final VoidCallback onTap;
  final Shape shape;

  const ImplicitFab({super.key, required this.onTap, required this.shape});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.elasticInOut,
        decoration: BoxDecoration(
          color: shape.color,
          borderRadius: BorderRadius.circular(shape.borderRadius),
        ),
        duration: _kDefaultExecutionTime,
        height: shape.height,
        width: shape.width,
      ),
    );
  }
}
