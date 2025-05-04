class HomeScreen extends StatelessWidget {
  final List<String> themes = [
    "Medico-chirurgical", "Materno-infantile", 
    "Santé communautaire", "Nursing intégré", "Santé mentale"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", height: 40),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: themes.length,
        itemBuilder: (ctx, index) => ThemeButton(
          theme: themes[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QuizScreen(theme: themes[index])),
          ),
        ),
      ),
    );
  }
}