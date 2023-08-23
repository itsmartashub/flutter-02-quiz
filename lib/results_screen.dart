import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  //? Map<K, V>   |   Map Key Value
  /* ! Map je, kao i List, generic type, gde specifiramo value naseg Key, i type naseg Value. Dakle imamo jos jedan <>, takoreci nested angulars. Gde cemo za Key da stavimo String, ali za Values cemo imati razlicite types podataka, i Stringove i Numbers, zato najbolje napisati Object, jer su sve vrednosti u Dartu Object, to mu dodje flexible type koji dozvoljava razlicite vvrste vrednosti
  Umesto ovog, alternativno bismo mogli da kreiramo novu klasu koje bi definsiala kako nas SummaryObject treba da izgleda, i onda bismo mogli da instanciramo nekoliko SummaryObjecta-a ovde (ja to kapiram kao componente sto su u Vue). I to je takodje dobro resenje, ali Max nam je hteo pokazati Map<K,V> i zato radi na ovaj nacin.
  
  Dakle getSummaryData treba da vrati Listu Map-a, */
  List<Map<String, Object>> getSummaryData() {
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        /* ? Expanded Widget
         - Expanded zvuci kao da child-ovi zauzimaju sav prostor koji mogu, ali bez ovo Expanded Columns zauzimaju beskonacnu sirinu, i van ekrana. A expanded dozvoljava child-ovima da zauzimaju prostora koliko mogu u flex widgetu ili main axisu. flex widget za recimo ovo dole Column, bi bio ovaj Ro, a amax flex widget za Row bi bio koliko j max visina screen.
         Dakle Extended se brine da child se ne siri dalje od parenta  */
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You answered X out of Y questions correctly!'),
              const SizedBox(height: 30),

              // ovde ne saljemo getSummaryData kao naziv vec je pozivamo jer njeno pozivanje vraca listu Map-a
              QuestionsSummary(getSummaryData()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text('Restart Quiz'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
