import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart'; // da bismo koristili questions
import 'package:quiz_app/results_screen.dart';

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

//@ #NACIN I sa initState
/* 
  // var activeScreen = const StartScreen();
  // Widget activeScreen = StartScreen(switchScreen);

  /* prosledjujuci fn switchScreen u StartScreen, sada mozemo da koristimo tu fn u StartScreen kad god
  PORDVUCENO switchScreen kao error:
  ! Error: The instance member 'switchScreen' can't be accessed in an initializer. Try replacing the reference to the instance member with a different expression
  ? Why: Both the variable & method creation happens at the same point of time (ie., simultaneously); When the class is instantiated
  Dakle taj error dobijamo jer koristimo switchScreen fn kada inicijalizujemo activeScreen varijablu, a to se desava istovremeno kad i taj metod void switchScreen() {...} kreiran. Dakle koristimo switchScreen prerano, pre engo sto smo ga kreirali jelte. Odnosno kada se klasa _QuizState pretvori u objekat
  * Resenje: dodajemo built-in metod initState(). To je emtod koji je provajdiran ovom State<Quiz> klasom koju extendujemo, ali mozemo je overrideovati koristeci neku nasu initialisation logiku. Ovo je metod koji inace zelimo da dodamo u nase State klase da odradi neki extra initialization work kada je taj State object kreiran for the first time
  ! dodajemo ? na Widget da ukazemo da activeScreen moze biti i null jer inicijalno ono nema value, vec joj se sa initState dodaje value */
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
*/

//@ #NACIN II sa ternarnim operatorom
  // final je jer ne planiramo da reassignujemo ovu varijablu, vec cemo samo dodavati nove elemente u listu
  // final List<String> selectedAnswers = [];
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // add() je built-in metod koji dodaje element u listu, bez da reassignuje varijablu vec reachuje tu list object u memoriji i dodaje novi item u taj object

    /*  ako su isti, znamo onda da vise nemamo pitanja i onda treba da switchujemo na results screen, koji za sad nemamo, pa cemo za sad vratiti na pocetni screen sa setState i activeScreen = 'start-screen';
    Medjutim, i dalje imamo onaj error na kraju svih pitanja jer nismo resetovali selectedAnswers = [], tj ponovo na praznu listu. Za to treba ipak da uklonimo final iz te promenljive */
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        // activeScreen = 'start-screen';
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      // prosledjujemo chooseAnswer fn kao value u QuestionsScreen gde cemo prihvatiti ovu vrednost named argumentom onSelectedAnswer
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }

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

          //? #NACIN I
          // child: activeScreen,

          //? #NACIN II
          /* child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(), */
          child: screenWidget,
        ),
      ),
    );
  }
}

//@ DOCUMENTATION
/* 
//? DEEP DIVE FLUTTER'S (STATEFUL) WIDGET LIFECYCLE
Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter (at certain points of time).

There are three extremely important (stateful) widget lifecycle methods you should be aware of:

__ initState(): Executed by Flutter when the StatefulWidget's State object is initialized 

__ build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called 
 
__ dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally) 
*/
