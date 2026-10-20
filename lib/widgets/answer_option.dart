import 'package:flutter/material.dart';

enum OptionState { normal, correct, wrong }

class AnswerOption extends StatelessWidget {
  final String label;
  final String text;
  final OptionState state;
  final VoidCallback? onTap;

  const AnswerOption({
    super.key,
    required this.label,
    required this.text,
    this.state = OptionState.normal,
    this.onTap,
  });

  Color get _baseColor {
    switch (state) {
      case OptionState.correct:
        return const Color(0xFF3C8527);
      case OptionState.wrong:
        return const Color(0xFFB02E26);
      case OptionState.normal:
        return const Color(0xFF7F7F7F);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final fontSize = (width * 0.028).clamp(10.0, 16.0);
    final borderWidth = (width * 0.007).clamp(3.0, 5.0);
    final light = Color.lerp(_baseColor, Colors.white, 0.4)!;
    final dark = Color.lerp(_baseColor, Colors.black, 0.5)!;
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      height: 1.4,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          color: _baseColor,
          border: Border(
            top: BorderSide(color: light, width: borderWidth),
            left: BorderSide(color: light, width: borderWidth),
            bottom: BorderSide(color: dark, width: borderWidth),
            right: BorderSide(color: dark, width: borderWidth),
          ),
        ),
        child: Row(
          children: [
            Text('$label.', style: textStyle),
            SizedBox(width: width * 0.02),
            Expanded(child: Text(text, style: textStyle)),
          ],
        ),
      ),
    );
  }
}