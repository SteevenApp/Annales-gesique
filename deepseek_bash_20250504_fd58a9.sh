annales-gesique/
├── lib/
│   ├── main.dart                  # Point d'entrée
│   ├── screens/                   # Écrans principaux
│   │   ├── home_screen.dart       # Accueil (thèmes)
│   │   ├── quiz_screen.dart       # Quiz interactif
│   │   ├── results_screen.dart    # Résultats + corrections
│   │   └── payment_screen.dart    # Abonnements
│   ├── models/                    # Modèles de données
│   │   ├── question_model.dart    # Structure des questions
│   │   └── user_model.dart        # Données utilisateur
│   ├── services/                  # Logique métier
│   │   ├── firestore_service.dart # Accès à Firebase
│   │   ├── auth_service.dart      # Authentification
│   │   └── payment_service.dart   # Paiements in-app
│   └── widgets/                   # Composants UI
│       ├── question_card.dart     # Affichage d'une question
│       └── theme_button.dart      # Bouton de thème
├── assets/
│   ├── images/                    # Logo, icônes
│   └── fonts/                     # Polices
└── firebase/                      # Config Firebase