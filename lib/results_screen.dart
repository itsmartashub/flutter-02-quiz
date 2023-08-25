import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  //? Map<K, V>   |   Map Key Value
  /* ! Map je, kao i List, generic type, gde specifiramo value naseg Key, i type naseg Value. Dakle imamo jos jedan <>, takoreci nested angulars. Gde cemo za Key da stavimo String, ali za Values cemo imati razlicite types podataka, i Stringove i Numbers, zato najbolje napisati Object, jer su sve vrednosti u Dartu Object, to mu dodje flexible type koji dozvoljava razlicite vvrste vrednosti
  Umesto ovog, alternativno bismo mogli da kreiramo novu klasu koje bi definsiala kako nas SummaryObject treba da izgleda, i onda bismo mogli da instanciramo nekoliko SummaryObjecta-a ovde (ja to kapiram kao componente sto su u Vue). I to je takodje dobro resenje, ali Max nam je hteo pokazati Map<K,V> i zato radi na ovaj nacin.
  
  Dakle getSummaryData treba da vrati Listu Map-a, */
  // List<Map<String, Object>> getSummaryData() {
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        // Map se sastoji od Key-Value pairs
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 86, 72, 106),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // ovde ne saljemo getSummaryData kao naziv vec je pozivamo jer njeno pozivanje vraca listu Map-a
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
