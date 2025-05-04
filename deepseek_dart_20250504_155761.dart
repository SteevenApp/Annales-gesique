class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Question>> getQuestions(String theme, {bool isFree = false}) async {
    QuerySnapshot snapshot = await _firestore
        .collection('questions')
        .where('theme', isEqualTo: theme)
        .limit(isFree ? 4 : 100)  // Limite pour la version gratuite
        .get();

    return snapshot.docs.map((doc) => Question.fromFirestore(doc)).toList();
  }
}