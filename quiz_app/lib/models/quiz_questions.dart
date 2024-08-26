class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    // how we are able to shuffle if are shuffling the list ??
    // answer : basically you are telling dart that the list obtained above is
    // final list , like I can't reassign it
    // shuffleList = [1, 2, 4, 5]; -> this you can't do !!!!
    return shuffleList;
  }
}
