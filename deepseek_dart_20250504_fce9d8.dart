class QuizScreen extends StatefulWidget {
  final String theme;

  QuizScreen({required this.theme});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    bool isFree = !(await PaymentService.isUserPremium());
    _questions = await FirestoreService().getQuestions(widget.theme, isFree: isFree);
    setState(() {});
  }

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentIndex].correctAnswer) {
      _score++;
    }
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) return Center(child: CircularProgressIndicator());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: _currentIndex / _questions.length),
            QuestionCard(
              question: _questions[_currentIndex],
              onAnswer: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}