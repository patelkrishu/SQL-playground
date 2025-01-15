class Quizqestion {
  final String question;
  final String answer;
  final List<String> options;
  final int timer;

  Quizqestion({
    required this.question,
    required this.answer,
    required this.options,
    required this.timer,
  });

  factory Quizqestion.fromMap(Map<String, dynamic> data) {
    print('* * * * * * * * * * *');
    print(data['question']);
    print(data['question'].runtimeType);
    print('* * * * * * * * * * *\n');
    return Quizqestion(
      question: data['question'].toString(),
      answer: data['ans'].toString(),
      options: List<String>.from(data['options'] as List),
      timer: data['timer']??0,
    );
  }
}