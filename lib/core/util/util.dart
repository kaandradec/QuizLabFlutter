import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_lab_app/core/util/enums.dart';
import 'package:quiz_lab_app/core/util/questions.dart';

Quiz decodeQuiz(QuestionType type, String jsonString) {
  final json = jsonDecode(jsonString);
  final currentDate = DateTime.now();

  switch (type) {
    case QuestionType.simpleChoice:
      final quizResponse = QuizResponse<SimpleChoiceQuestion>.fromJson(
        json,
        (json) => SimpleChoiceQuestion.fromJson(json),
      );
      return quizResponse.toQuiz(createdDate: currentDate);

    case QuestionType.multipleChoice:
      final quizResponse = QuizResponse<MultipleChoiceQuestion>.fromJson(
        json,
        (json) => MultipleChoiceQuestion.fromJson(json),
      );
      return quizResponse.toQuiz(createdDate: currentDate);

    case QuestionType.trueFalse:
      final quizResponse = QuizResponse<TrueFalseQuestion>.fromJson(
        json,
        (json) => TrueFalseQuestion.fromJson(json),
      );
      return quizResponse.toQuiz(createdDate: currentDate);

    case QuestionType.mixed:
      final quizResponse = MixedQuizResponse.fromJson(json);
      return quizResponse.toQuiz(createdDate: currentDate);

    default:
      throw UnimplementedError('Question type not implemented: $type');
  }
}

/// Función auxiliar para decodificar JSON
dynamic jsonDecode(String source) {
  return const JsonDecoder().convert(source);
}

/// Clase auxiliar para la decodificación JSON
class JsonDecoder {
  const JsonDecoder();

  dynamic convert(String source) {
    return const JsonCodec().decode(source);
  }
}

// Implementa la función darker similar a Kotlin
Color darker(Color color, double factor) {
  final intRed = color.r * 255; // Convert to 0-255 range
  final intGreen = color.g * 255; // Convert to 0-255 range
  final intBlue = color.b * 255; // Convert to 0-255 range

  return Color.fromARGB(
    255, // Use the original alpha value
    (intRed * factor).round().clamp(0, 255), // Use .red for red
    (intGreen * factor).round().clamp(0, 255), // Use .green for green
    (intBlue * factor).round().clamp(0, 255), // Use .blue for blue
  );
}
