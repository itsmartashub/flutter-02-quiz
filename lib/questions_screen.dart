import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
// import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];

    /* dodajemo SizedBox da bi nas Column tj content zauzimao citavu sirinu ekrana koliko god ona bila, to cemo odraditi sa double.infinity. To je special value koji znaci: use as much width as you can, as wide is possible */
    return SizedBox(
      width: double.infinity,
      child: Column(
        /* novi nacin za centriranje kontenta. Ako se koristi u Column on vertikalno centrira jer su u Columnu sadrzaj jedan ispod drugog, a ako se koristi u Row() onda horizontalno centrira jer je tu sadrzaj jedan pored drugog, dakle u zavisnosti od MAIN AXIS-a se vrsi centriranje.
        * - MainAxisAlignment ima vrednosti kao flexbox u css, .spaceBetween, .spaceAround, .spaceEvenly */
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(height: 20),
          /* ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 3'),
          ), */
          //? sa position argument; order vazan
          // AnswerButton('Answer text', () {}),
          //? sa named argument; order nevazan
          /* AnswerButton(onTap: () {}, answerText: currentQuestion.answers[0]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[1]),
          AnswerButton(onTap: () {}, answerText: currentQuestion.answers[2]), */

          /* ! ovo je podvuceno sve crvenim jer children: zeli Listu widgeta, a mi ovim map kreiramo novu Listu, Listu unutar Liste. zato moramo korisiti spread operator ...
          ! Dakle ono sto spreading radi je pretvara neted listu (listu unutar liste) u jednu listu. NPR: [[1,2,3],4] u [1,2,3,4] */
          ...currentQuestion.answers.map((answer) {
            return AnswerButton(
              onTap: () {},
              answerText: answer,
            );
          })
        ],
      ),
    );
  }
}
