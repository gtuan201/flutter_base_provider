import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  final Widget child;
  const GradientMask({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Color(0xFF833AB4), // Instagram gradient start color
              Colors.purpleAccent,
              Colors.deepOrangeAccent,
              Colors.red, // Instagram gradient end color
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp,
          ).createShader(bounds);
        },
        child: child
    );
  }
}
