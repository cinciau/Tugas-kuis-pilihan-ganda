import 'package:flutter/material.dart';

class MinecraftButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MinecraftButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final fontSize = (width * 0.035).clamp(12.0, 20.0);
    final borderWidth = (width * 0.008).clamp(3.0, 6.0);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.08,
          vertical: width * 0.035,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF7F7F7F),
          border: Border(
            top: BorderSide(color: const Color(0xFFD0D0D0), width: borderWidth),
            left: BorderSide(color: const Color(0xFFD0D0D0), width: borderWidth),
            bottom: BorderSide(color: const Color(0xFF373737), width: borderWidth),
            right: BorderSide(color: const Color(0xFF373737), width: borderWidth),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            shadows: const [Shadow(color: Colors.black54, offset: Offset(2, 2))],
          ),
        ),
      ),
    );
  }
}