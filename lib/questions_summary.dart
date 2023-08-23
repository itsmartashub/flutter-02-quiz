import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          /* ? Type Casting with as keyword.
          - Naime, stavili smo za Map value da bude Object, tako da Dart ne zna koji ce ovde biti tip i ne mozemo sabirati i ponasati se kao da je broj. Zato treba da type-castujemo sa as int. as se obicno koristi sa Map 
          ! Ali sad imamo drugi problem, a to je da Text() ne prihvata brojeve vec string, pa sad treba sve to da konvertujemo u String tako sto cemo sve to wrapovati i upotrebiti .toString() */
          children: [
            Text(((data['question'] as int) + 1).toString()),
          ],
        );
      }).toList(),
    );
  }
}
