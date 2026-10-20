import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/minecraft_background.dart';
import '../widgets/minecraft_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
                'HASIL',
                style: TextStyle(color: Colors.white, fontSize: titleSize),
              ),
              SizedBox(height: size.height * 0.05),
              MinecraftButton(
                label: 'MAIN LAGI',
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}