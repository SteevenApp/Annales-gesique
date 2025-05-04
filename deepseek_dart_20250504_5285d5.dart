class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('scores')
          .snapshots(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (ctx, index) {
            var scoreData = snapshot.data!.docs[index];
            return ListTile(
              title: Text("Thème: ${scoreData['theme']}"),
              subtitle: Text("Score: ${scoreData['score']}/${scoreData['total']}"),
              trailing: Text(DateFormat('dd/MM/yyyy').format(scoreData['date'].toDate())),
            );
          },
        );
      },
    );
  }
}