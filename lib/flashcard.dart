class Flashcard {
  String question;
  String answer;

  Flashcard(this.question, this.answer);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Flashcard && runtimeType == other.runtimeType && question == other.question && answer == other.answer;

  @override
  int get hashCode => question.hashCode ^ answer.hashCode;
}