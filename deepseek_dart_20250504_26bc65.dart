class ResultsScreen extends StatelessWidget {
  final int score;
  final List<Question> questions;

  ResultsScreen({required this.score, required this.questions});

  @override
  Widget build(BuildContext context) {
    bool isPassed = score >= questions.length * 0.7; // Seuil de réussite : 70%

    return Scaffold(
      appBar: AppBar(title: Text("Résultats")),
      body: Column(
        children: [
          Text("Score: $score/${questions.length}", style: TextStyle(fontSize: 24)),
          isPassed 
              ? Icon(Icons.celebration, color: Colors.green, size: 50)
              : Icon(Icons.refresh, color: Colors.red, size: 50),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => QuizScreen(theme: questions.first.theme)),
            child: Text("Recommencer"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (ctx, index) => CorrectionCard(question: questions[index]),
            ),
          ),
        ],
      ),
    );
  }
}