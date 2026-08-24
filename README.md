# TACO EDEN Mobility - Monorepo

Maquettes fonctionnelles 100% mock - Douala, Cameroun
Palette TACO EDEN : Bleu #1A6EBF + Vert #2DB872 + Blanc (d'après carte de visite)

## Structure
```
taco_eden/
├── apps/
│   ├── client/      → App Passager (Android APK) - bleu primaire
│   ├── driver/      → App Chauffeur (Android APK) - vert primaire
│   └── admin_web/   → Admin Web (Flutter Web)
```

## Apps séparées
| App | Dossier | Build | Artifact |
|-----|---------|-------|----------|
| Client | `apps/client` | `flutter build apk --release` | `taco-eden-client-apk` |
| Chauffeur | `apps/driver` | `flutter build apk --release` | `taco-eden-driver-apk` |
| Admin | `apps/admin_web` | `flutter build web --release` | `taco-eden-admin-web` |

## Lancer en local
```bash
cd apps/client && flutter run        # ou driver / admin_web
```

## Builds automatiques
Push sur `main` → 3 workflows séparés :
- `Build Client APK`
- `Build Driver APK`
- `Build Admin Web`

Récupère les APK dans `Actions` → chaque workflow → `Artifacts`
