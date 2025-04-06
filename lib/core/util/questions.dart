/// Interfaz base para las preguntas
abstract class Question {
  String get prompt;
  String get question;
  String get hint;
  String get explanation;
  DateTime get createdDate;
  DateTime get modifiedDate;
}

/// Implementación vacía para Question
class EmptyQuestion implements Question {
  @override
  String get prompt => '';

  @override
  String get question => '';

  @override
  String get hint => '';

  @override
  String get explanation => '';

  @override
  DateTime get createdDate => DateTime.now();

  @override
  DateTime get modifiedDate => DateTime.now();
}

/// Modelo para un quiz completo
class Quiz {
  final int? id;
  final String title;
  final String description;
  final String topic;
  final List<String> tags;
  final DateTime createdDate;
  final List<Question> questions;

  Quiz({
    this.id,
    required this.title,
    required this.description,
    required this.topic,
    required this.tags,
    required this.createdDate,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      topic: json['topic'],
      tags: List<String>.from(json['tags']),
      createdDate: DateTime.parse(json['createdDate']),
      questions: [], // Este necesita lógica especial para reconocer el tipo
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'topic': topic,
      'tags': tags,
      'createdDate': createdDate.toIso8601String(),
      // La serialización de questions depende del tipo
    };
  }
}

/// Respuesta genérica de quiz para cualquier tipo de pregunta
class QuizResponse<T extends Question> {
  final String title;
  final String description;
  final String topic;
  final List<String> tags;
  final List<T> questions;

  QuizResponse({
    required this.title,
    required this.description,
    required this.topic,
    required this.tags,
    required this.questions,
  });

  Quiz toQuiz({required DateTime createdDate}) {
    return Quiz(
      title: title,
      description: description,
      topic: topic,
      tags: tags,
      createdDate: createdDate,
      questions: questions,
    );
  }

  factory QuizResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return QuizResponse<T>(
      title: json['title'],
      description: json['description'],
      topic: json['topic'],
      tags: List<String>.from(json['tags']),
      questions: (json['questions'] as List).map((q) => fromJson(q)).toList(),
    );
  }
}

/// Respuesta mixta de quiz con diferentes tipos de preguntas
class MixedQuizResponse {
  final String title;
  final String description;
  final String topic;
  final List<String> tags;
  final List<SimpleChoiceQuestion> simpleChoiceQuestionList;
  final List<MultipleChoiceQuestion> multipleChoiceQuestionList;
  final List<TrueFalseQuestion> trueFalseQuestionList;

  MixedQuizResponse({
    required this.title,
    required this.description,
    required this.topic,
    required this.tags,
    required this.simpleChoiceQuestionList,
    required this.multipleChoiceQuestionList,
    required this.trueFalseQuestionList,
  });

  Quiz toQuiz({required DateTime createdDate}) {
    List<Question> allQuestions = [
      ...simpleChoiceQuestionList,
      ...multipleChoiceQuestionList,
      ...trueFalseQuestionList,
    ];

    return Quiz(
      title: title,
      description: description,
      topic: topic,
      tags: tags,
      createdDate: createdDate,
      questions: allQuestions,
    );
  }

  factory MixedQuizResponse.fromJson(Map<String, dynamic> json) {
    return MixedQuizResponse(
      title: json['title'],
      description: json['description'],
      topic: json['topic'],
      tags: List<String>.from(json['tags']),
      simpleChoiceQuestionList:
          (json['simpleChoiceQuestionList'] as List)
              .map((q) => SimpleChoiceQuestion.fromJson(q))
              .toList(),
      multipleChoiceQuestionList:
          (json['multipleChoiceQuestionList'] as List)
              .map((q) => MultipleChoiceQuestion.fromJson(q))
              .toList(),
      trueFalseQuestionList:
          (json['trueFalseQuestionList'] as List)
              .map((q) => TrueFalseQuestion.fromJson(q))
              .toList(),
    );
  }
}

/// Pregunta de opción simple (una sola respuesta correcta)
class SimpleChoiceQuestion implements Question {
  final int? id;
  @override
  final String prompt;
  @override
  final String question;
  @override
  final String hint;
  @override
  final String explanation;
  @override
  final DateTime createdDate;
  @override
  final DateTime modifiedDate;
  final List<String> options;
  final int correctAnswerIndex;
  int? selectedOptionIndex;

  SimpleChoiceQuestion({
    this.id,
    required this.prompt,
    required this.question,
    required this.hint,
    required this.explanation,
    required this.createdDate,
    required this.modifiedDate,
    required this.options,
    required this.correctAnswerIndex,
    this.selectedOptionIndex,
  });

  factory SimpleChoiceQuestion.fromJson(Map<String, dynamic> json) {
    return SimpleChoiceQuestion(
      id: json['id'],
      prompt: json['prompt'],
      question: json['question'],
      hint: json['hint'],
      explanation: json['explanation'],
      createdDate:
          json['createdDate'] != null
              ? DateTime.parse(json['createdDate'])
              : DateTime.now(),
      modifiedDate:
          json['modifiedDate'] != null
              ? DateTime.parse(json['modifiedDate'])
              : DateTime.now(),
      options: List<String>.from(json['options']),
      correctAnswerIndex: json['correctAnswerIndex'],
      selectedOptionIndex: json['selectedOptionIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prompt': prompt,
      'question': question,
      'hint': hint,
      'explanation': explanation,
      'createdDate': createdDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
      'selectedOptionIndex': selectedOptionIndex,
    };
  }
}

/// Pregunta de opción múltiple (varias respuestas correctas)
class MultipleChoiceQuestion implements Question {
  final int? id;
  @override
  final String prompt;
  @override
  final String question;
  @override
  final String hint;
  @override
  final String explanation;
  @override
  final DateTime createdDate;
  @override
  final DateTime modifiedDate;
  final List<String> options;
  final List<int> correctAnswerIndexes;
  List<int>? selectedOptionsIndexes;

  MultipleChoiceQuestion({
    this.id,
    required this.prompt,
    required this.question,
    required this.hint,
    required this.explanation,
    required this.createdDate,
    required this.modifiedDate,
    required this.options,
    required this.correctAnswerIndexes,
    this.selectedOptionsIndexes,
  });

  factory MultipleChoiceQuestion.fromJson(Map<String, dynamic> json) {
    return MultipleChoiceQuestion(
      id: json['id'],
      prompt: json['prompt'],
      question: json['question'],
      hint: json['hint'],
      explanation: json['explanation'],
      createdDate:
          json['createdDate'] != null
              ? DateTime.parse(json['createdDate'])
              : DateTime.now(),
      modifiedDate:
          json['modifiedDate'] != null
              ? DateTime.parse(json['modifiedDate'])
              : DateTime.now(),
      options: List<String>.from(json['options']),
      correctAnswerIndexes: List<int>.from(json['correctAnswerIndexes']),
      selectedOptionsIndexes:
          json['selectedOptionsIndexes'] != null
              ? List<int>.from(json['selectedOptionsIndexes'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prompt': prompt,
      'question': question,
      'hint': hint,
      'explanation': explanation,
      'createdDate': createdDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
      'options': options,
      'correctAnswerIndexes': correctAnswerIndexes,
      'selectedOptionsIndexes': selectedOptionsIndexes,
    };
  }
}

/// Pregunta de verdadero/falso
class TrueFalseQuestion implements Question {
  final int? id;
  @override
  final String prompt;
  @override
  final String question;
  @override
  final String hint;
  @override
  final String explanation;
  @override
  final DateTime createdDate;
  @override
  final DateTime modifiedDate;
  final bool correctAnswer;
  bool? userAnswer;

  TrueFalseQuestion({
    this.id,
    required this.prompt,
    required this.question,
    required this.hint,
    required this.explanation,
    required this.createdDate,
    required this.modifiedDate,
    required this.correctAnswer,
    this.userAnswer,
  });

  factory TrueFalseQuestion.fromJson(Map<String, dynamic> json) {
    return TrueFalseQuestion(
      id: json['id'],
      prompt: json['prompt'],
      question: json['question'],
      hint: json['hint'],
      explanation: json['explanation'],
      createdDate:
          json['createdDate'] != null
              ? DateTime.parse(json['createdDate'])
              : DateTime.now(),
      modifiedDate:
          json['modifiedDate'] != null
              ? DateTime.parse(json['modifiedDate'])
              : DateTime.now(),
      correctAnswer: json['correctAnswer'],
      userAnswer: json['userAnswer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prompt': prompt,
      'question': question,
      'hint': hint,
      'explanation': explanation,
      'createdDate': createdDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
      'correctAnswer': correctAnswer,
      'userAnswer': userAnswer,
    };
  }
}
