import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/minecraft_background.dart';
import '../widgets/minecraft_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _messageFor(double ratio) {
    if (ratio == 1) return 'LEGENDA MINECRAFT!';
    if (ratio >= 0.7) return 'KEREN, SANG PENAMBANG!';
    if (ratio >= 0.4) return 'LUMAYAN, TERUS LATIHAN!';
    return 'MASIH NOOB, COBA LAGI!';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final size = MediaQuery.sizeOf(context);
    final titleSize = (size.width * 0.05).clamp(16.0, 32.0);
    final scoreSize = (size.width * 0.12).clamp(32.0, 72.0);
    final textSize = (size.width * 0.03).clamp(11.0, 18.0);
    final iconSize = (size.width * 0.15).clamp(48.0, 96.0);
    final borderWidth = (size.width * 0.007).clamp(3.0, 5.0);
    final gap = size.height * 0.03;

    final ratio = quiz.score / quiz.totalQuestions;

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
                    'HASIL KUIS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      shadows: const [
                        Shadow(color: Colors.black, offset: Offset(3, 3)),
                      ],
                    ),
                  ),
                  SizedBox(height: gap),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(size.width * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.75),
                      border: Border.all(color: Colors.white70, width: borderWidth),
                    ),
                    child: Column(
                      children: [
                        Text(
                          quiz.playerName.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white70, fontSize: textSize),
                        ),
                        SizedBox(height: gap * 0.5),
                        Text(
                          '${quiz.score}/${quiz.totalQuestions}',
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: scoreSize,
                          ),
                        ),
                        SizedBox(height: gap * 0.5),
                        Text(
                          _messageFor(ratio),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textSize,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: gap * 1.5),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: size.width * 0.03,
                    runSpacing: gap,
                    children: [
                      MinecraftButton(
                        label: 'MAIN LAGI',
                        onPressed: () {
                          context.read<QuizProvider>().resetQuiz();
                          context.go('/quiz');
                        },
                      ),
                      MinecraftButton(
                        label: 'MENU UTAMA',
                        onPressed: () {
                          context.read<QuizProvider>().resetQuiz();
                          context.go('/');
                        },
                      ),
                    ],
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