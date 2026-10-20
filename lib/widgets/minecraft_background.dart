import 'package:flutter/material.dart';

class MinecraftBackground extends StatelessWidget {
  final Widget child;
  const MinecraftBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/bg_mc.jpe', fit: BoxFit.cover),
        Container(color: Colors.black.withValues(alpha: 0.35)),
        SafeArea(child: child),
      ],
    );
  }
}