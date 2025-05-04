function syncToFirebase() {
  const sheet = SpreadsheetApp.getActiveSheet();
  const data = sheet.getDataRange().getValues();
  data.slice(1).forEach(row => {
    FirebaseFirestore.getInstance().collection("questions").add({
      question: row[0], theme: row[1], options: [row[2], row[3], row[4], row[5]],
      correctAnswer: row[6], explanation: row[7]
    });
  });
}