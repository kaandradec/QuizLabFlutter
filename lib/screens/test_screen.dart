import 'package:flutter/material.dart';
import 'package:quiz_lab_app/components/play_true_false_question.dart';
import 'package:quiz_lab_app/main.dart';
import 'package:quiz_lab_app/core/util/enums.dart';
import 'package:quiz_lab_app/core/util/questions.dart';
import 'package:quiz_lab_app/core/util/util.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _subjectController = TextEditingController();
  String? _msg;
  Quiz? _quiz;

  Future<void> _generateQuizSubject(String subject) async {
    setState(() {
      _msg = "Generating quiz...";
    });
    try {
      final response = await supabase.functions.invoke(
        'generate-quiz-subject', // El nombre de tu Edge Function
        body: {
          "inputType": "SUBJECT",
          "questionsFormat": "TRUEFALSE",
          "numberOfQuestions": "1",
          "lang": "english",
          "creativity": "2.0",
          "dificulty": "hard",
          "subject": subject,
        }, // Parámetros para la función
      );

      if (response.status != 200) {
        throw Exception('Error: ${response.status}');
      }

      final text = response.data['text'] as String;
      // setState(() {
      //   _msg = data['text'] as String;
      // });
      final quiz = decodeQuiz(QuestionType.trueFalse, text);
      setState(() {
        _msg = "Quiz generated successfully!";
        _quiz = quiz;
      });

      // Aquí puedes procesar los datos y actualizar la UI
    } catch (error) {
      setState(() {
        _msg = "Error: ${error.toString()}";
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _subjectController,
            decoration: InputDecoration(label: Text('Subject')),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final subject = _subjectController.text.trim();
              if (subject.isNotEmpty) {
                _generateQuizSubject(subject);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a subject')),
                );
              }
            },
            child: Text('Submit'),
          ),
          if (_msg != null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(_msg!, style: TextStyle(fontSize: 16)),
            ),
          if (_quiz != null)
            ..._quiz!.questions.map((question) {
              return switch (question) {
                TrueFalseQuestion q => PlayTrueFalseQuestion(
                  question: q,
                  blockAnswerSelection: false,
                ),
                _ => Text('Unsupported question type'),
              };
            }),
        ],
      ),
    );
  }
}
