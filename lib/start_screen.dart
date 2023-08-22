import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
        const Text('Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 205, 239, 248),
            )),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'))
        //! kada koristimo .icon na btn, child vise nije child vec label!
        // child: const Text('Start Quiz'))
      ],
    ));
  }
}