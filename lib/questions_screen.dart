import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    /* dodajemo SizedBox da bi nas Column tj content zauzimao citavu sirinu ekrana koliko god ona bila, to cemo odraditi sa double.infinity. To je special value koji znaci: use as much width as you can, as wide is possible */
    return SizedBox(
      width: double.infinity,
      child: Column(
        /* novi nacin za centriranje kontenta. Ako se koristi u Column on vertikalno centrira jer su u Columnu sadrzaj jedan ispod drugog, a ako se koristi u Row() onda horizontalno centrira jer je tu sadrzaj jedan pored drugog, dakle u zavisnosti od MAIN AXIC-a se vrsi centriranje.
        MainAxisAlignment ima vrednosti kao flexbox u css, .spaceBetween, .spaceAround, .spaceEvenly */
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The question...'),
          const SizedBox(height: 20),
          ElevatedButton(
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
          ),
        ],
      ),
    );
  }
}
