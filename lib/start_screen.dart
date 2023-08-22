import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  /* U quiz.dart u StartScreen smo prosledili kao parametar onu void startsQuiz fn, koju ovde prihvatamo i mozemo je nazvati kako god. Koristimo positional parametar tehniku.
  ! Moramo staviti ispred njega tip, a to je Function, ali da bvismo biuli jos precizniji stavljamo void Function(), i to znaci da startKviz treba da bude Function (a Function je tip koji je built-in u Dart) koja NE PRIHVATA argumente, jer jelte, switchScreen nema argumente, i koja takodje ne vraca vrednost (to je ovo void).
  
  Medjutim, posto zelimo ovu startrKviz da koristimo dole u btn onPressed, moramo da je prvo definisemo u ovoj klasi kao varijablu, to cemo uraditi sa final void Function() startKviz  i onda mozemo umesto void Function() startKviz koji je za parametar u StartScreenu, koristiti this.startKviz  */
  // const StartScreen(void Function() startKviz, {super.key});
  const StartScreen(this.startKviz, {super.key});

  final void Function() startKviz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /* //! treba da izbegavamo Opacity() jer vuce performanse
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
        ), */
        //! alternativa za Opacity() je koriscenje color
        Image.asset('assets/images/quiz-logo.png',
            width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(height: 80),
        Text('Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 205, 239, 248),
            )),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            // onPressed: () {
            //   startKviz();
            // },
            onPressed: startKviz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'))
        //! kada koristimo .icon na btn, child vise nije child vec label!
        // child: const Text('Start Quiz'))
      ],
    ));
  }
}
