# VTC Afrique - Douala - Maquette Fonctionnelle

MVP 100% mock data - Flutter seul - 1 fichier `lib/main.dart`

## Lancer en local
```bash
flutter pub get
flutter run
```

## Build APK local
```bash
flutter build apk --release
# -> build/app/outputs/flutter-apk/app-release.apk
```

## Build automatique GitHub Actions
Pousse sur GitHub (branche `main`) -> onglet `Actions` -> workflow `Build APK` -> télécharge l'artifact `app-release-apk`
