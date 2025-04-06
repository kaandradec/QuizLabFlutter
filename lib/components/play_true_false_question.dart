import 'package:flutter/material.dart';
import 'package:quiz_lab_app/core/util/questions.dart';
import 'package:quiz_lab_app/core/util/util.dart';

enum UserAnswer { none, trueAnswer, falseAnswer }

class PlayTrueFalseQuestion extends StatefulWidget {
  final TrueFalseQuestion question;
  final VoidCallback? onAnswerSelected;
  final bool blockAnswerSelection;

  const PlayTrueFalseQuestion({
    super.key,
    required this.question,
    this.onAnswerSelected,
    this.blockAnswerSelection = false,
  });

  @override
  State<PlayTrueFalseQuestion> createState() => _PlayTrueFalseQuestionState();
}

class _PlayTrueFalseQuestionState extends State<PlayTrueFalseQuestion> {
  UserAnswer userAnswer = UserAnswer.none;

  @override
  void didUpdateWidget(PlayTrueFalseQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question != widget.question) {
      // Reset user selected option when question changes
      setState(() {
        userAnswer = UserAnswer.none;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Define los colores exactos del diseño de Kotlin
    final greenColor = const Color.fromARGB(255, 0, 164, 80);

    // final greenColor = const Color(0xFF00a450);
    final redColor = const Color(0xFFd94266);
    final surfaceColor = colorScheme.surface;
    final onSurfaceColor = colorScheme.onSurface;

    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.library_add_check,
                size: 16,
                color: onSurfaceColor.withAlpha(
                  (onSurfaceColor.a * 0.8)
                      .round(), // Replaced `onSurfaceColor.alpha` with `onSurfaceColor.a`
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "True False",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: onSurfaceColor.withAlpha(
                    (onSurfaceColor.a * 0.8)
                        .round(), // Replaced `onSurfaceColor.alpha` with `onSurfaceColor.a`
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          Text(
            widget.question.prompt,
            style: theme.textTheme.titleSmall?.copyWith(
              color: onSurfaceColor.withAlpha(200),
            ),
          ),
          const SizedBox(height: 8),

          Text(widget.question.question, style: theme.textTheme.titleLarge),
          const SizedBox(height: 16),

          // TRUE Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  userAnswer == UserAnswer.trueAnswer
                      ? greenColor
                      : darker(greenColor, 0.85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed:
                widget.blockAnswerSelection
                    ? null
                    : () {
                      setState(() {
                        userAnswer = UserAnswer.trueAnswer;
                        widget.question.userAnswer = true;
                      });
                      widget.onAnswerSelected?.call();
                    },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TRUE",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: userAnswer == UserAnswer.trueAnswer ? 24 : 0,
                  child: AnimatedOpacity(
                    opacity: userAnswer == UserAnswer.trueAnswer ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // FALSE Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  userAnswer == UserAnswer.falseAnswer
                      ? redColor
                      : darker(redColor, 0.85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed:
                widget.blockAnswerSelection
                    ? null
                    : () {
                      setState(() {
                        userAnswer = UserAnswer.falseAnswer;
                        widget.question.userAnswer = false;
                      });
                      widget.onAnswerSelected?.call();
                    },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FALSE",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: userAnswer == UserAnswer.falseAnswer ? 24 : 0,
                  child: AnimatedOpacity(
                    opacity: userAnswer == UserAnswer.falseAnswer ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
