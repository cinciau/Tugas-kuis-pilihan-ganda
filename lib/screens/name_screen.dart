import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/minecraft_background.dart';
import '../widgets/minecraft_button.dart';
import '../widgets/minecraft_text_field.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late final TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<QuizProvider>().playerName,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      setState(() => _error = 'Nama tidak boleh kosong!');
      return;
    }
    context.read<QuizProvider>().setPlayerName(name);
    context.go('/quiz');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final titleSize = (size.width * 0.05).clamp(16.0, 32.0);
    final errorSize = (size.width * 0.025).clamp(10.0, 14.0);

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
                    'SIAPA NAMAMU?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      shadows: const [
                        Shadow(color: Colors.black, offset: Offset(3, 3)),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  MinecraftTextField(
                    controller: _controller,
                    hint: 'Ketik namamu',
                    onSubmitted: _submit,
                  ),
                  if (_error != null) ...[
                    SizedBox(height: size.height * 0.015),
                    Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: errorSize,
                      ),
                    ),
                  ],
                  SizedBox(height: size.height * 0.05),
                  MinecraftButton(label: 'LANJUT', onPressed: _submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}