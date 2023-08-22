import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(MaterialApp(
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
              child: const StartScreen()))));
}
