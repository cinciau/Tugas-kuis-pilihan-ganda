import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../widgets/minecraft_background.dart';
import '../widgets/minecraft_button.dart';
import '../providers/quiz_provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final titleSize = (size.width * 0.05).clamp(16.0, 32.0);

    return Scaffold(
      body: MinecraftBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'HALO, ${context.watch<QuizProvider>().playerName.toUpperCase()}!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: titleSize),
              ),
              SizedBox(height: size.height * 0.05),
              MinecraftButton(
                label: 'SELESAI',
                onPressed: () => context.go('/result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}