import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  /* i widgete mozemo da cuvamo kao variables
  ``` A value of type 'QuestionsScreen' can't be assigned to a variable
  ``` ofte 'StartScreeni.
  - Dobijamo ovaj error jer activeScreen zakljucuje kog je tipa na osnovu vrednosti koja je koriscnena za inicijalizaciju ove varijable a to je u ovom slucaju StartScreen tip, jer kad god kreiramo ovu klasu StartScreen, ta klasa nam automatski daje tip sa istim imenom.
  
  ! I mi sad treba da ucinimo activeScreen malo manje restriktivnim, da moze da prihvata sve vrste tipova, a ne samo StartScreen. To cemo uraditi tako sto cemo var zameniti sa Widget.
  
  Elem activeScreen cemo koristiti dole kao vrednost za child, jer child SAMO ZELI WIDGET, a activeScreen sadrzi widget */
  // var activeScreen = const StartScreen();
  Widget activeScreen = const StartScreen();

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      // Scaffold se ugl koristi da se setuju podesavanja za SCREEN nase app (bg color itd)
      // Elem, a posto hocemo sad ovde gradient bg, koristicemo Container jr nam on omogucava da setujemo decoration na njega. I wrapovacemo ovaj StartScreen widget u njega jer zelimo da koristimo isti setup, isti screen bg color na svim screens koje cemo dodati. Zato ne stavljamo ovaj gradient na specific screen (kao recimo StartScreen), vec cemo StartScreen da wrapujemo
      // home: Scaffold(body: StartScreen())));
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 93, 185, 110),
            Color.fromARGB(255, 116, 106, 211)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          // child: const StartScreen(),
          child: activeScreen,
        ),
      ),
    );
  }
}
