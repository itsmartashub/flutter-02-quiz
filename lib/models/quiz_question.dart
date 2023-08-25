class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

/*
ali pre engo sto cemo odraditi shuffle() zelimo prvo da kopiramo originalu Listu odgovora, jer nam se u njoj uvek tacan odgovor nalazi na prvom mestu, a shuffle metod mutira originalnu listu, za razliku od map() metoda koji ne mutira originalnu listu vec kreira svoju listu, dakle ne bismo znali koji je tacan odg.  */
  // List<String> getShuffledAnswers() {
  List<String> get shuffledAnswers {
    //! kreiranje kopirane originalne liste, to radimo sa List.of(originalna_lista). To je built-in List classa, dakle List nije samo type vec i class built into Dart. .of je constructor fn List klase. of kreiranja kopiju originalne liste
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
