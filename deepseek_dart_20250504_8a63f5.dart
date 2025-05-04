class CorrectionCard extends StatelessWidget {
  final Question question;

  CorrectionCard({required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.question, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Réponse correcte: ${question.options[question.correctAnswer]}"),
            SizedBox(height: 8),
            Text("Explication: ${question.explanation}"),
          ],
        ),
      ),
    );
  }
}