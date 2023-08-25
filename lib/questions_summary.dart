import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              /* ? Type Casting with as keyword.
              - Naime, stavili smo za Map value da bude Object, tako da Dart ne zna koji ce ovde biti tip i ne mozemo sabirati i ponasati se kao da je broj. Zato treba da type-castujemo sa as int. as se obicno koristi sa Map 
              ! Ali sad imamo drugi problem, a to je da Text() ne prihvata brojeve vec string, pa sad treba sve to da konvertujemo u String tako sto cemo sve to wrapovati i upotrebiti .toString() */
              children: [
                Text(((data['question_index'] as int) + 1).toString()),

                /* ? Expanded Widget
                - Expanded zvuci kao da child-ovi zauzimaju sav prostor koji mogu, ali bez ovo Expanded Columns zauzimaju beskonacnu sirinu, i van ekrana. A expanded dozvoljava child-ovima da zauzimaju prostora koliko mogu u flex widgetu ili main axisu. flex widget za recimo ovo dole Column, bi bio ovaj Ro, a amax flex widget za Row bi bio koliko j max visina screen.
                Dakle Extended se brine da child se ne siri dalje od parenta  */
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
