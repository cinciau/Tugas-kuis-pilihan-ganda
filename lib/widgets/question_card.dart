import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String text;
  const QuestionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final fontSize = (width * 0.032).clamp(11.0, 18.0);
    final borderWidth = (width * 0.007).clamp(3.0, 5.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.75),
        border: Border.all(color: Colors.white70, width: borderWidth),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: fontSize, height: 1.5),
      ),
    );
  }
}