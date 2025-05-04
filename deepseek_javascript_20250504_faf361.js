rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /questions/{id} {
      allow read: if request.auth != null;
      allow write: if request.auth.token.admin == true;
    }
    match /users/{userId} {
      allow read, update: if request.auth.uid == userId;
      allow create: if request.auth.uid != null;
    }
  }
}