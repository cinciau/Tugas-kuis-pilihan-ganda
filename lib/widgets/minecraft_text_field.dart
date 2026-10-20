import 'package:flutter/material.dart';

class MinecraftTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback? onSubmitted;

  const MinecraftTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final fontSize = (width * 0.03).clamp(12.0, 20.0);
    final borderWidth = (width * 0.008).clamp(3.0, 6.0);

    OutlineInputBorder border(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: color, width: borderWidth),
        );

    return TextField(
      controller: controller,
      maxLength: 20,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
      onSubmitted: (_) => onSubmitted?.call(),
      decoration: InputDecoration(
        counterText: '',
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54, fontSize: fontSize),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.7),
        contentPadding: EdgeInsets.all(width * 0.03),
        enabledBorder: border(const Color(0xFF7F7F7F)),
        focusedBorder: border(Colors.greenAccent),
      ),
    );
  }
}