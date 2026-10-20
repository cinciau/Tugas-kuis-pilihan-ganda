import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/minecraft_background.dart';
import '../widgets/minecraft_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final titleSize = (size.width * 0.07).clamp(18.0, 40.0);
    final subtitleSize = (size.width * 0.03).clamp(10.0, 16.0);
    final iconSize = (size.width * 0.2).clamp(60.0, 120.0);

    return Scaffold(
      body: MinecraftBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.06),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MINECRAFT QUIZ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      shadows: const [Shadow(color: Colors.black, offset: Offset(3, 3))],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Seberapa jauh kamu kenal dunia kotak-kotak?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: subtitleSize),
                  ),
                  SizedBox(height: size.height * 0.06),
                  MinecraftButton(
                    label: 'MULAI',
                    onPressed: () => context.go('/name'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}