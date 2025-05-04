MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.green[700],
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
    ),
  ),
  home: HomeScreen(),
);