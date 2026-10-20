import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_option.dart';
import '../widgets/minecraft_background.dart';
import '../widgets/minecraft_button.dart';
import '../widgets/question_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final question = quiz.currentQuestion;
    final size = MediaQuery.sizeOf(context);
    final headerSize = (size.width * 0.028).clamp(10.0, 16.0);
    final gap = size.height * 0.02;
    const letters = ['A', 'B', 'C', 'D'];

    OptionState stateFor(int i) {
      if (!quiz.isAnswered) return OptionState.normal;
      if (i == question.correctIndex) return OptionState.correct;
      if (i == quiz.selectedAnswer) return OptionState.wrong;
      return OptionState.normal;
    }

    final headerStyle = TextStyle(color: Colors.white, fontSize: headerSize);

    return Scaffold(
      body: MinecraftBackground(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SOAL ${quiz.currentIndex + 1}/${quiz.totalQuestions}',
                        style: headerStyle,
                      ),
                      SizedBox(width: size.width * 0.03),
                      Flexible(
                        child: Text(
                          quiz.playerName.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: gap),
                  LinearProgressIndicator(
                    value: quiz.progress,
                    minHeight: size.height * 0.015,
                    backgroundColor: Colors.black54,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(height: gap * 1.5),
                  QuestionCard(text: question.text),
                  SizedBox(height: gap * 1.5),
                  for (int i = 0; i < question.options.length; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: gap),
                      child: AnswerOption(
                        label: letters[i],
                        text: question.options[i],
                        state: stateFor(i),
                        onTap: () => context.read<QuizProvider>().selectAnswer(i),
                      ),
                    ),
                  if (quiz.isAnswered) ...[
                    SizedBox(height: gap),
                    Center(
                      child: MinecraftButton(
                        label: quiz.isLastQuestion ? 'LIHAT HASIL' : 'LANJUT',
                        onPressed: () {
                          if (quiz.isLastQuestion) {
                            context.go('/result');
                          } else {
                            context.read<QuizProvider>().nextQuestion();
                          }
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}