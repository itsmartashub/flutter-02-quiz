import 'package:flutter/material.dart';

// pravimo reusable button. malo je glupo da imamo zilion dugmadi i sad ako nesto treba da promenimo u btn-u, morali bismo pesaka u svakom tom dugmetu. Zato pravimo svoj custom btn widget
class AnswerButton extends StatelessWidget {
  //? positional arguments
//  AnswerButton(this.answerText, this.onTap, {super.key});

  //? named arguments, dodajemo required jer su po defaultu named arguments optional, a nama su ovi argumenti potrebni
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 86, 72, 106),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(answerText),
    );
  }
}
