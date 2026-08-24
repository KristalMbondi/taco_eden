// ============================================================
// TACO EDEN - MVP Maquette Fonctionnelle - Douala, Cameroun
// 100% Mock Data - Aucun serveur, aucune API externe
// Un seul fichier main.dart - Flutter SDK seul
// Commentaires en franÃ§ais - Material 3
// Choix par defaut: Palette bleu-vert confiance (#0E3A3E) + accent orange (#FF6B35), FCFA par defaut, 5 chauffeurs / 6 courses / 7 transactions
// ============================================================

import 'package:flutter/material.dart';
import 'dart:async';

// ============================================================
// SECTION 1 - MODELES DE DONNEES FICTIVES (MOCK DATA)
// ============================================================

// Modele chauffeur fictif
class ChauffeurMock {
  final String nom;
  final double note;
  final String plaque;
  final String vehicule;
  final Color couleurAvatar;
  final IconData icone;
  final String creneau; // "Jour" ou "Nuit"
  final bool actif;
  final int coursesDuJour;
  ChauffeurMock({
    required this.nom,
    required this.note,
    required this.plaque,
    required this.vehicule,
    required this.couleurAvatar,
    required this.icone,
    required this.creneau,
    required this.actif,
    required this.coursesDuJour,
  });
}

// Modele course passee
class CourseMock {
  final String depart;
  final String arrivee;
  final int prix;
  final String date;
  final int note;
  final String statut;
  CourseMock({
    required this.depart,
    required this.arrivee,
    required this.prix,
    required this.date,
    required this.note,
    required this.statut,
  });
}

// Modele transaction wallet
class TransactionMock {
  final String type; // recharge, course, remboursement
  final String libelle;
  final int montant; // positif = credit, negatif = debit
  final String date;
  final IconData icone;
  TransactionMock({
    required this.type,
    required this.libelle,
    required this.montant,
    required this.date,
    required this.icone,
  });
}

// Modele devise fictive
class DeviseMock {
  final String code;
  final String nom;
  final String symbole;
  final double tauxVersFCFA; // 1 FCFA = taux
  DeviseMock({required this.code, required this.nom, required this.symbole, required this.tauxVersFCFA});
}

// ============================================================
// SECTION 2 - DONNEES FICTIVES HARCODEES
// ============================================================

final List<ChauffeurMock> chauffeursMock = [
  ChauffeurMock(nom: "Jean-Paul E.", note: 4.9, plaque: "LT 3421 CE", vehicule: "Toyota Corolla Blanche", couleurAvatar: Color(0xFF1A6EBF), icone: Icons.person, creneau: "Jour", actif: true, coursesDuJour: 8),
  ChauffeurMock(nom: "AÃ¯ssatou B.", note: 4.8, plaque: "CE 8912 LT", vehicule: "Honda Civic Grise", couleurAvatar: Color(0xFF2DB872), icone: Icons.person_3, creneau: "Nuit", actif: true, coursesDuJour: 5),
  ChauffeurMock(nom: "Samuel K.", note: 4.7, plaque: "NO 1123 AD", vehicule: "Kia Rio Bleue", couleurAvatar: Color(0xFF2DB872), icone: Icons.person_4, creneau: "Jour", actif: true, coursesDuJour: 11),
  ChauffeurMock(nom: "Fatima N.", note: 4.9, plaque: "SW 7788 CE", vehicule: "Hyundai i10 Rouge", couleurAvatar: Color(0xFF6C5CE7), icone: Icons.person_2, creneau: "Jour", actif: false, coursesDuJour: 0),
  ChauffeurMock(nom: "Emmanuel T.", note: 4.6, plaque: "OU 5541 LT", vehicule: "Suzuki Swift Blanche", couleurAvatar: Color(0xFFE17055), icone: Icons.person, creneau: "Nuit", actif: true, coursesDuJour: 3),
];

final List<CourseMock> historiqueMock = [
  CourseMock(depart: "Akwa", arrivee: "Bonapriso", prix: 2800, date: "19 AoÃ»t 2026, 08:12", note: 5, statut: "Terminee"),
  CourseMock(depart: "Bonamoussadi", arrivee: "Aeroport Douala", prix: 5500, date: "17 AoÃ»t 2026, 14:30", note: 4, statut: "Terminee"),
  CourseMock(depart: "Deido", arrivee: "Makepe", prix: 1800, date: "15 AoÃ»t 2026, 18:45", note: 5, statut: "Terminee"),
  CourseMock(depart: "Bali", arrivee: "Akwa", prix: 1500, date: "12 AoÃ»t 2026, 09:00", note: 4, statut: "Terminee"),
  CourseMock(depart: "Ndokoti", arrivee: "Village", prix: 3200, date: "10 AoÃ»t 2026, 19:20", note: 5, statut: "Terminee"),
  CourseMock(depart: "Logbaba", arrivee: "Bonaberi", prix: 4000, date: "08 AoÃ»t 2026, 07:55", note: 3, statut: "Annulee"),
];

final List<TransactionMock> transactionsMock = [
  TransactionMock(type: "recharge", libelle: "Recharge MTN MoMo", montant: 10000, date: "20 AoÃ»t 2026", icone: Icons.phone_android),
  TransactionMock(type: "course", libelle: "Course Akwa â†’ Bonapriso", montant: -2800, date: "19 AoÃ»t 2026", icone: Icons.directions_car),
  TransactionMock(type: "recharge", libelle: "Recharge Orange Money", montant: 5000, date: "18 AoÃ»t 2026", icone: Icons.account_balance_wallet),
  TransactionMock(type: "course", libelle: "Course Bonamoussadi â†’ Aeroport", montant: -5500, date: "17 AoÃ»t 2026", icone: Icons.directions_car),
  TransactionMock(type: "remboursement", libelle: "Remboursement credit d'urgence", montant: -1200, date: "16 AoÃ»t 2026", icone: Icons.shield),
  TransactionMock(type: "course", libelle: "Course Deido â†’ Makepe", montant: -1800, date: "15 AoÃ»t 2026", icone: Icons.directions_car),
  TransactionMock(type: "recharge", libelle: "Bonus parrainage", montant: 2000, date: "14 AoÃ»t 2026", icone: Icons.card_giftcard),
];

final List<DeviseMock> devisesMock = [
  DeviseMock(code: "FCFA", nom: "Franc CFA", symbole: "FCFA", tauxVersFCFA: 1),
  DeviseMock(code: "NGN", nom: "Naira Nigerian", symbole: "NGN", tauxVersFCFA: 0.75),
  DeviseMock(code: "GHS", nom: "Cedi Ghaneen", symbole: "GHS", tauxVersFCFA: 0.022),
];

// ============================================================
// SECTION 3 - POINT D'ENTREE ET THEME GLOBAL
// ============================================================

void main() {
  runApp(const VTCAfriqueApp());
}

class VTCAfriqueApp extends StatelessWidget {
  const VTCAfriqueApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TACO EDEN - Client',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A6EBF),
          primary: const Color(0xFF1A6EBF),
          secondary: const Color(0xFF2DB872),
          tertiary: const Color(0xFF2DB872),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A6EBF),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF2DB872),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
      ),
      home: const RacineApp(),
    );
  }
}

// ============================================================
// SECTION 4 - RACINE CLIENT DEDIEE + LOGIN (sans menu chauffeur/admin)
// ============================================================

class RacineApp extends StatefulWidget {
  const RacineApp({super.key});
  @override
  State<RacineApp> createState() => _RacineAppState();
}

class _RacineAppState extends State<RacineApp> {
  bool isLoggedIn = false;
  bool showSplash = true;
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  String loginError = "";
  int indexPassager = 0;
  int soldeFCFA = 4200;
  DeviseMock deviseSelectionnee = devisesMock[0];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400), () { if (mounted) setState(() => showSplash = false); });
  }
  @override
  void dispose() { userCtrl.dispose(); passCtrl.dispose(); super.dispose(); }
  String formatMontant(int m) {
    double t = deviseSelectionnee.tauxVersFCFA;
    if (deviseSelectionnee.code == "FCFA") return "$m ${deviseSelectionnee.symbole}";
    double c = m * t;
    if (deviseSelectionnee.code == "NGN") return "NGN${c.toStringAsFixed(0)}";
    if (deviseSelectionnee.code == "GHS") return "GHS${c.toStringAsFixed(2)}";
    return "${c.toStringAsFixed(0)} ${deviseSelectionnee.code}";
  }
  void ajouterSolde(int v) => setState(() => soldeFCFA += v);
  void debiterSolde(int v) => setState(() => soldeFCFA -= v);
  void tryLogin() {
    if (userCtrl.text.trim() == "Kristal" && passCtrl.text == "123456") { setState(() { isLoggedIn = true; loginError = ""; }); }
    else { setState(() => loginError = "Identifiants incorrects. Utilise Kristal / 123456"); }
  }
  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return Scaffold(backgroundColor: const Color(0xFFF6F9FC), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1A6EBF), Color(0xFF2DB872)]), borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: const Color(0xFF1A6EBF).withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))]), child: const Icon(Icons.directions_car, size: 48, color: Colors.white)), const SizedBox(height: 20), const Text("TACO EDEN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28, letterSpacing: 1.2, color: Color(0xFF1A6EBF))), const Text("MOBILITY  -  Douala", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, letterSpacing: 2, color: Color(0xFF2DB872))), const SizedBox(height: 8), Text("ET PUIS QUOI ENCORE ?", style: TextStyle(color: Colors.grey.shade500, fontSize: 11, letterSpacing: 1)), const SizedBox(height: 24), const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF2DB872)))])));
    }
    if (!isLoggedIn) {
      return Scaffold(backgroundColor: const Color(0xFFF6F9FC), body: SafeArea(child: ListView(padding: const EdgeInsets.all(24), children: [const SizedBox(height: 30), Center(child: Column(children: [Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1A6EBF), Color(0xFF2DB872)]), borderRadius: BorderRadius.circular(20)), child: const Icon(Icons.directions_car, size: 40, color: Colors.white)), const SizedBox(height: 14), const Text("TACO EDEN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Color(0xFF1A6EBF))), const Text("MOBILITY", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, letterSpacing: 3, color: Color(0xFF2DB872)))])), const SizedBox(height: 32), Card(child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Connexion Passager", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)), const SizedBox(height: 4), Text("Demo - Utilise Kristal / 123456", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)), const SizedBox(height: 18), TextField(controller: userCtrl, decoration: InputDecoration(labelText: "Nom d'utilisateur", hintText: "Kristal", prefixIcon: const Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))), const SizedBox(height: 14), TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(labelText: "Mot de passe", hintText: "123456", prefixIcon: const Icon(Icons.lock), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))), if (loginError.isNotEmpty) ...[const SizedBox(height: 10), Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.red.shade200)), child: Row(children: [Icon(Icons.error, size: 16, color: Colors.red.shade700), const SizedBox(width: 6), Expanded(child: Text(loginError, style: TextStyle(color: Colors.red.shade700, fontSize: 12))) ]))], const SizedBox(height: 18), SizedBox(width: double.infinity, child: FilledButton(onPressed: tryLogin, child: const Text("Se connecter"))), const SizedBox(height: 8), Center(child: TextButton(onPressed: () { userCtrl.text = "Kristal"; passCtrl.text = "123456"; tryLogin(); }, child: const Text("Remplir automatiquement")))])))]))));
    }
    return Scaffold(appBar: AppBar(title: const Text("TACO EDEN - Client", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)), actions: [IconButton(onPressed: () => setState(() { isLoggedIn = false; indexPassager = 0; }), icon: const Icon(Icons.logout), tooltip: "Deconnexion")]), body: PassagerRoot(index: indexPassager, soldeFCFA: soldeFCFA, devise: deviseSelectionnee, onDeviseChange: (d) => setState(() => deviseSelectionnee = d), formatMontant: formatMontant, onSoldeChange: (delta) { if (delta > 0) ajouterSolde(delta); else debiterSolde(-delta); }), bottomNavigationBar: NavigationBar(selectedIndex: indexPassager, onDestinationSelected: (i) => setState(() => indexPassager = i), destinations: const [NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: "Accueil"), NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: "Wallet"), NavigationDestination(icon: Icon(Icons.history), selectedIcon: Icon(Icons.history), label: "Historique"), NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: "Profil")]));
  }
}
// ============================================================
// SECTION 5 - MODE PASSAGER (PRIORITAIRE ET LE PLUS DETAILLE)
// ============================================================

// Etapes du flux de commande
enum EtapePassager { accueil, estimation, walletCheck, suivi, fin }

class PassagerRoot extends StatefulWidget {
  final int index;
  final int soldeFCFA;
  final DeviseMock devise;
  final Function(DeviseMock) onDeviseChange;
  final String Function(int) formatMontant;
  final Function(int) onSoldeChange;
  const PassagerRoot({super.key, required this.index, required this.soldeFCFA, required this.devise, required this.onDeviseChange, required this.formatMontant, required this.onSoldeChange});
  @override
  State<PassagerRoot> createState() => _PassagerRootState();
}

class _PassagerRootState extends State<PassagerRoot> {
  EtapePassager etape = EtapePassager.accueil;
  final TextEditingController destCtrl = TextEditingController();
  String depart = "Akwa, Douala";
  String destination = "";
  int prixBase = 2500;
  // Majorations simulees
  bool majorationHeurePointe = true;
  bool majorationPluie = true;
  bool majorationTrafic = false;
  int get supplement => (majorationHeurePointe ? 800 : 0) + (majorationPluie ? 600 : 0) + (majorationTrafic ? 500 : 0);
  int get prixTotal => prixBase + supplement;
  ChauffeurMock chauffeurActuel = chauffeursMock[0];
  int noteDonnee = 0;
  double progressionSuivi = 0;
  Timer? timerSuivi;

  @override
  void dispose() {
    destCtrl.dispose();
    timerSuivi?.cancel();
    super.dispose();
  }

  void lancerSuivi() {
    setState(() => progressionSuivi = 0);
    timerSuivi?.cancel();
    timerSuivi = Timer.periodic(const Duration(milliseconds: 80), (t) {
      setState(() {
        progressionSuivi += 0.008;
        if (progressionSuivi >= 1) {
          progressionSuivi = 1;
          t.cancel();
          setState(() => etape = EtapePassager.fin);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Navigation par onglets passager
    if (widget.index == 1) return WalletPassager(soldeFCFA: widget.soldeFCFA, devise: widget.devise, onDeviseChange: widget.onDeviseChange, formatMontant: widget.formatMontant, onSoldeChange: widget.onSoldeChange);
    if (widget.index == 2) return HistoriquePassager(formatMontant: widget.formatMontant);
    if (widget.index == 3) return const ProfilPassager();

    // Onglet Accueil = flux de commande
    switch (etape) {
      case EtapePassager.accueil:
        return EcranAccueilPassager(
          depart: depart,
          destCtrl: destCtrl,
          chauffeurActuel: chauffeurActuel,
          onCommander: (dest) {
            if (dest.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Entre une destination (ex: Bonapriso)")));
              return;
            }
            setState(() {
              destination = dest;
              // Aleatoire simule pour varier la demo
              prixBase = 2200 + (dest.length * 110) % 1500;
              etape = EtapePassager.estimation;
            });
          },
        );
      case EtapePassager.estimation:
        return EcranEstimation(
          depart: depart,
          arrivee: destination,
          prixBase: prixBase,
          supplement: supplement,
          prixTotal: prixTotal,
          majorationHeurePointe: majorationHeurePointe,
          majorationPluie: majorationPluie,
          majorationTrafic: majorationTrafic,
          onMajHeurePointe: (v) => setState(() => majorationHeurePointe = v),
          onMajPluie: (v) => setState(() => majorationPluie = v),
          onMajTrafic: (v) => setState(() => majorationTrafic = v),
          formatMontant: widget.formatMontant,
          onConfirmer: () => setState(() => etape = EtapePassager.walletCheck),
          onRetour: () => setState(() => etape = EtapePassager.accueil),
        );
      case EtapePassager.walletCheck:
        return EcranWalletCheck(
          prixTotal: prixTotal,
          solde: widget.soldeFCFA,
          formatMontant: widget.formatMontant,
          onPayer: () {
            widget.onSoldeChange(-prixTotal);
            // Chauffeur aleatoire
            chauffeurActuel = (chauffeursMock..shuffle()).first;
            setState(() => etape = EtapePassager.suivi);
            lancerSuivi();
          },
          onCreditUrgence: () {
            // Simule credit d'urgence : on debite quand mÃªme mais affiche badge
            widget.onSoldeChange(-prixTotal);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Credit d'urgence utilise (-1200 FCFA de frais) - Course lancee !"), backgroundColor: Color(0xFF1A6EBF)));
            chauffeurActuel = chauffeursMock[1];
            setState(() => etape = EtapePassager.suivi);
            lancerSuivi();
          },
          onRecharger: () {
            // Redirige vers wallet
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recharge ton Wallet d'abord")));
          },
          onRetour: () => setState(() => etape = EtapePassager.estimation),
        );
      case EtapePassager.suivi:
        return EcranSuiviCourse(
          depart: depart,
          arrivee: destination,
          chauffeur: chauffeurActuel,
          progression: progressionSuivi,
          onSOS: () => showDialog(context: context, builder: (_) => AlertDialog(title: const Text("SOS - Urgence"), content: const Text("Signal envoye au centre de securite TACO EDEN Douala.\nUn operateur te rappelle dans 60 secondes.\nPosition partagee: Akwa - Bonapriso."), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))])),
          onArriveeForcee: () {
            timerSuivi?.cancel();
            setState(() => etape = EtapePassager.fin);
          },
        );
      case EtapePassager.fin:
        return EcranFinCourse(
          depart: depart,
          arrivee: destination,
          prix: prixTotal,
          chauffeur: chauffeurActuel,
          noteDonnee: noteDonnee,
          onNote: (n) => setState(() => noteDonnee = n),
          formatMontant: widget.formatMontant,
          onTerminer: () => setState(() {
            etape = EtapePassager.accueil;
            noteDonnee = 0;
            progressionSuivi = 0;
            destCtrl.clear();
          }),
        );
    }
  }
}

// -------- Ecran Accueil Passager : Carte simulee + recherche --------
class EcranAccueilPassager extends StatelessWidget {
  final String depart;
  final TextEditingController destCtrl;
  final ChauffeurMock chauffeurActuel;
  final Function(String) onCommander;
  const EcranAccueilPassager({super.key, required this.depart, required this.destCtrl, required this.chauffeurActuel, required this.onCommander});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Carte simulee (Container degrade + formes)
        CarteSimulee(hauteur: 220, showCar: false),
        const SizedBox(height: 12),
        Row(children: [Icon(Icons.location_on, size: 14, color: Colors.grey.shade600), const SizedBox(width: 6), Text("Position actuelle: $depart - Douala, Cameroun", style: TextStyle(fontSize: 12, color: Colors.grey.shade600))]),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("OÃ¹ vas-tu ?", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              const SizedBox(height: 12),
              TextField(enabled: false, decoration: InputDecoration(prefixIcon: const Icon(Icons.my_location, size: 18), hintText: depart, filled: true, fillColor: const Color(0xFFF6F9FC), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
              const SizedBox(height: 10),
              TextField(controller: destCtrl, decoration: InputDecoration(prefixIcon: const Icon(Icons.search, color: Color(0xFF2DB872)), hintText: "Saisis ta destination (ex: Bonapriso, Makepe...)", filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF2DB872), width: 1.5)))),
              const SizedBox(height: 10),
              Wrap(spacing: 8, children: [
                ActionChip(label: const Text("Bonapriso"), onPressed: () => destCtrl.text = "Bonapriso"),
                ActionChip(label: const Text("Bonamoussadi"), onPressed: () => destCtrl.text = "Bonamoussadi"),
                ActionChip(label: const Text("Aeroport"), onPressed: () => destCtrl.text = "Aeroport Douala"),
                ActionChip(label: const Text("Makepe"), onPressed: () => destCtrl.text = "Makepe"),
              ]),
              const SizedBox(height: 16),
              SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => onCommander(destCtrl.text), icon: const Icon(Icons.bolt), label: const Text("Commander maintenant"))),
              const SizedBox(height: 8),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: chauffeurActuel.couleurAvatar, child: Icon(chauffeurActuel.icone, color: Colors.white)),
            title: Text("Chauffeur proche: ${chauffeurActuel.nom}", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            subtitle: Text("${chauffeurActuel.vehicule} - â­ ${chauffeurActuel.note} - ${chauffeurActuel.plaque}", style: const TextStyle(fontSize: 11)),
            trailing: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.green.shade200)), child: Text("~3 min", style: TextStyle(fontSize: 11, color: Colors.green.shade700, fontWeight: FontWeight.w700))),
          ),
        ),
      ],
    );
  }
}

// -------- Ecran Estimation avec badges majoration --------
class EcranEstimation extends StatelessWidget {
  final String depart;
  final String arrivee;
  final int prixBase;
  final int supplement;
  final int prixTotal;
  final bool majorationHeurePointe;
  final bool majorationPluie;
  final bool majorationTrafic;
  final Function(bool) onMajHeurePointe;
  final Function(bool) onMajPluie;
  final Function(bool) onMajTrafic;
  final String Function(int) formatMontant;
  final VoidCallback onConfirmer;
  final VoidCallback onRetour;
  const EcranEstimation({super.key, required this.depart, required this.arrivee, required this.prixBase, required this.supplement, required this.prixTotal, required this.majorationHeurePointe, required this.majorationPluie, required this.majorationTrafic, required this.onMajHeurePointe, required this.onMajPluie, required this.onMajTrafic, required this.formatMontant, required this.onConfirmer, required this.onRetour});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [IconButton(onPressed: onRetour, icon: const Icon(Icons.arrow_back)), const Text("Estimation", style: TextStyle(fontWeight: FontWeight.w800))]),
        CarteSimulee(hauteur: 140, showCar: false, showRoute: true, depart: depart, arrivee: arrivee),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [const Icon(Icons.trip_origin, size: 14, color: Color(0xFF2DB872)), const SizedBox(width: 8), Expanded(child: Text(depart, style: const TextStyle(fontWeight: FontWeight.w600)))]),
              Container(margin: const EdgeInsets.only(left: 6), height: 18, width: 1, color: Colors.grey.shade300),
              Row(children: [const Icon(Icons.location_on, size: 14, color: Color(0xFF2DB872)), const SizedBox(width: 8), Expanded(child: Text(arrivee, style: const TextStyle(fontWeight: FontWeight.w600)))]),
              const Divider(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Distance", style: TextStyle(color: Colors.grey.shade600)), const Text("6.2 km", style: TextStyle(fontWeight: FontWeight.w700))]),
              const SizedBox(height: 6),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Duree estimee", style: TextStyle(color: Colors.grey.shade600)), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF1A6EBF), borderRadius: BorderRadius.circular(20)), child: const Text("18 min", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)))]),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        const Text("Majorations simulees (demo)", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
        const SizedBox(height: 8),
        // Badges simules sans calcul complexe
        Card(
          child: Column(children: [
            SwitchListTile(value: majorationHeurePointe, onChanged: onMajHeurePointe, title: const Text("Heure de pointe", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)), subtitle: const Text("07h-09h & 17h-20h - +800 FCFA", style: TextStyle(fontSize: 11)), secondary: BadgeMajoration(label: "+800", icon: Icons.access_time, active: majorationHeurePointe)),
            const Divider(height: 1),
            SwitchListTile(value: majorationPluie, onChanged: onMajPluie, title: const Text("Pluie detectee", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)), subtitle: const Text("Meteo Douala - +600 FCFA", style: TextStyle(fontSize: 11)), secondary: BadgeMajoration(label: "+600", icon: Icons.water_drop, active: majorationPluie)),
            const Divider(height: 1),
            SwitchListTile(value: majorationTrafic, onChanged: onMajTrafic, title: const Text("Trafic dense", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)), subtitle: const Text("Axe Akwa-Bonapriso - +500 FCFA", style: TextStyle(fontSize: 11)), secondary: BadgeMajoration(label: "+500", icon: Icons.traffic, active: majorationTrafic)),
          ]),
        ),
        const SizedBox(height: 12),
        Card(
          color: const Color(0xFF1A6EBF),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Prix de base", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)), Text(formatMontant(prixBase), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600))]),
              const SizedBox(height: 6),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Supplements", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)), Text("+ ${formatMontant(supplement)}", style: const TextStyle(color: Color(0xFFFFC49A), fontWeight: FontWeight.w700))]),
              const Divider(color: Colors.white24, height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Total estime", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)), Text(formatMontant(prixTotal), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20))]),
              const SizedBox(height: 4),
              Text("Paiement via Wallet - Mobile Money possible", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11)),
            ]),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: onConfirmer, child: Text("Confirmer - ${formatMontant(prixTotal)}"))),
        TextButton(onPressed: onRetour, child: const Text("Retour")),
      ],
    );
  }
}

// Badge visuel majoration
class BadgeMajoration extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;
  const BadgeMajoration({super.key, required this.label, required this.icon, required this.active});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: active ? const Color(0xFF2DB872) : Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 12, color: active ? Colors.white : Colors.grey.shade600), const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: active ? Colors.white : Colors.grey.shade600))]),
    );
  }
}

// -------- Ecran Verification Wallet (3 cas) --------
class EcranWalletCheck extends StatelessWidget {
  final int prixTotal;
  final int solde;
  final String Function(int) formatMontant;
  final VoidCallback onPayer;
  final VoidCallback onCreditUrgence;
  final VoidCallback onRecharger;
  final VoidCallback onRetour;
  const EcranWalletCheck({super.key, required this.prixTotal, required this.solde, required this.formatMontant, required this.onPayer, required this.onCreditUrgence, required this.onRecharger, required this.onRetour});
  @override
  Widget build(BuildContext context) {
    // Logique 3 cas
    // Cas A : solde suffisant
    // Cas B : solde insuffisant mais eligible (>2000 et au moins 3 courses) => credit urgence
    // Cas C : sinon refus
    final bool casA = solde >= prixTotal;
    final bool eligibleCredit = solde >= 1500 && historiqueMock.length >= 3;
    final bool casB = !casA && eligibleCredit;
    // final bool casC = !casA && !eligibleCredit;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(children: [IconButton(onPressed: onRetour, icon: const Icon(Icons.arrow_back)), const Text("Verification Wallet", style: TextStyle(fontWeight: FontWeight.w800))]),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Icon(Icons.account_balance_wallet, size: 40, color: const Color(0xFF1A6EBF).withOpacity(0.9)),
              const SizedBox(height: 8),
              Text("Solde actuel", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              Text(formatMontant(solde), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 26, color: Color(0xFF1A6EBF))),
              const SizedBox(height: 6),
              Text("Prix course: ${formatMontant(prixTotal)}", style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
        const SizedBox(height: 16),
        if (casA)
          Card(
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Icon(Icons.check_circle, color: Colors.green.shade700), const SizedBox(width: 8), Text("Solde suffisant", style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.w800))]),
                const SizedBox(height: 8),
                Text("Ton wallet couvre la course. Le montant sera debite Ã  la fin.", style: TextStyle(color: Colors.green.shade800, fontSize: 12)),
                const SizedBox(height: 12),
                SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: onPayer, icon: const Icon(Icons.bolt), label: const Text("Lancer la course"))),
              ]),
            ),
          )
        else if (casB)
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Icon(Icons.shield, color: Colors.orange.shade800), const SizedBox(width: 8), Expanded(child: Text("Credit d'urgence disponible", style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.w800)))]),
                const SizedBox(height: 8),
                Text("Solde insuffisant (${formatMontant(solde)} < ${formatMontant(prixTotal)}), mais tu es eligible au credit d'urgence TACO EDEN (client fidele).", style: TextStyle(color: Colors.orange.shade900, fontSize: 12)),
                const SizedBox(height: 6),
                Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.orange.shade200)), child: Row(children: [Icon(Icons.info, size: 14, color: Colors.orange.shade700), const SizedBox(width: 6), Expanded(child: Text("Frais: 1200 FCFA rembourses Ã  la prochaine recharge. Course lancee immediatement.", style: TextStyle(fontSize: 11, color: Colors.orange.shade800)))])),
                const SizedBox(height: 12),
                SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: onCreditUrgence, icon: const Icon(Icons.emergency), label: const Text("Utiliser le credit d'urgence"))),
                TextButton(onPressed: onRecharger, child: const Text("Ou recharger maintenant")),
              ]),
            ),
          )
        else
          Card(
            color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Icon(Icons.block, color: Colors.red.shade700), const SizedBox(width: 8), Text("Solde insuffisant", style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.w800))]),
                const SizedBox(height: 8),
                Text("Tu n'es pas eligible au credit d'urgence (nouveau compte). Recharge ton wallet via Mobile Money pour continuer.", style: TextStyle(color: Colors.red.shade800, fontSize: 12)),
                const SizedBox(height: 12),
                SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => showRechargeDialog(context), icon: const Icon(Icons.phone_android), label: const Text("Recharger via Mobile Money"))),
              ]),
            ),
          ),
        const SizedBox(height: 12),
        Center(child: TextButton.icon(onPressed: onRetour, icon: const Icon(Icons.arrow_back, size: 16), label: const Text("Modifier la course"))),
      ],
    );
  }

  static void showRechargeDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => AlertDialog(title: const Text("Recharger Wallet (Simule)"), content: const Text("Choisis ton operateur:\n- MTN MoMo\n- Orange Money\n\nEntre le montant et valide. Aucun vrai paiement n'est effectue (demo)."), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")), FilledButton(onPressed: () { Navigator.pop(context); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recharge simulee : +5000 FCFA credites !"))); }, child: const Text("Simuler +5000 FCFA"))]));
  }
}

// -------- Ecran Suivi de course (anime) --------
class EcranSuiviCourse extends StatelessWidget {
  final String depart;
  final String arrivee;
  final ChauffeurMock chauffeur;
  final double progression;
  final VoidCallback onSOS;
  final VoidCallback onArriveeForcee;
  const EcranSuiviCourse({super.key, required this.depart, required this.arrivee, required this.chauffeur, required this.progression, required this.onSOS, required this.onArriveeForcee});
  @override
  Widget build(BuildContext context) {
    final int pct = (progression * 100).toInt();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Course en cours", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)), Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)), child: Text("$pct% - En route", style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)))]),
        const SizedBox(height: 12),
        // Carte animee
        CarteSimulee(hauteur: 260, showCar: true, progression: progression, depart: depart, arrivee: arrivee),
        const SizedBox(height: 12),
        LinearProgressIndicator(value: progression, minHeight: 6, borderRadius: BorderRadius.circular(99), backgroundColor: Colors.grey.shade200, color: const Color(0xFF2DB872)),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(children: [
              CircleAvatar(radius: 26, backgroundColor: chauffeur.couleurAvatar, child: Icon(chauffeur.icone, color: Colors.white, size: 26)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(chauffeur.nom, style: const TextStyle(fontWeight: FontWeight.w800)),
                  Text("${chauffeur.vehicule} - ${chauffeur.plaque}", style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                  Row(children: [Icon(Icons.star, size: 14, color: Colors.amber.shade700), const SizedBox(width: 4), Text("${chauffeur.note} - Chauffeur verifie", style: TextStyle(fontSize: 11, color: Colors.grey.shade600))]),
                ]),
              ),
              IconButton.filled(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Appel simule vers le chauffeur..."))), icon: const Icon(Icons.call), style: IconButton.styleFrom(backgroundColor: const Color(0xFF2DB872))),
            ]),
          ),
        ),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: OutlinedButton.icon(onPressed: onSOS, icon: const Icon(Icons.sos, color: Colors.red), label: const Text("SOS", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800)), style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red)))),
          const SizedBox(width: 10),
          Expanded(child: OutlinedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Partage de position envoye Ã  un proche (simule)"))), icon: const Icon(Icons.share_location), label: const Text("Partager"))),
        ]),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Depart", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)), Text(depart, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12))]),
              const Divider(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Arrivee", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)), Text(arrivee, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12))]),
              const Divider(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Temps restant", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)), Text("${(18 * (1 - progression)).ceil()} min", style: const TextStyle(fontWeight: FontWeight.w800))]),
            ]),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(onPressed: onArriveeForcee, child: const Text("Simuler arrivee immediate (demo)")),
      ],
    );
  }
}

// -------- Ecran fin de course + notation --------
class EcranFinCourse extends StatelessWidget {
  final String depart;
  final String arrivee;
  final int prix;
  final ChauffeurMock chauffeur;
  final int noteDonnee;
  final Function(int) onNote;
  final String Function(int) formatMontant;
  final VoidCallback onTerminer;
  const EcranFinCourse({super.key, required this.depart, required this.arrivee, required this.prix, required this.chauffeur, required this.noteDonnee, required this.onNote, required this.formatMontant, required this.onTerminer});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 56),
        const SizedBox(height: 8),
        const Center(child: Text("Course terminee !", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22))),
        Center(child: Text("Merci d'avoir voyage avec TACO EDEN", style: TextStyle(color: Colors.grey.shade600))),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("ReÃ§u", style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Trajet", style: TextStyle(color: Colors.grey.shade600)), Text("$depart â†’ $arrivee", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12))]),
              const SizedBox(height: 6),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Chauffeur", style: TextStyle(color: Colors.grey.shade600)), Text(chauffeur.nom, style: const TextStyle(fontWeight: FontWeight.w600))]),
              const SizedBox(height: 6),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Distance", style: TextStyle(color: Colors.grey.shade600)), const Text("6.2 km")]),
              const Divider(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Total paye", style: TextStyle(fontWeight: FontWeight.w800)), Text(formatMontant(prix), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Color(0xFF1A6EBF)))]),
              const SizedBox(height: 4),
              Row(children: [Icon(Icons.receipt, size: 12, color: Colors.grey.shade500), const SizedBox(width: 4), Text("ReÃ§u envoye par SMS (simule) - ID #VTC-${20260821}", style: TextStyle(fontSize: 10, color: Colors.grey.shade500))]),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const Text("Note ton chauffeur", style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text("Optionnel - tu peux passer", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(5, (i) {
                final selected = i < noteDonnee;
                return IconButton(onPressed: () => onNote(i + 1), icon: Icon(selected ? Icons.star : Icons.star_border, color: selected ? Colors.amber.shade700 : Colors.grey.shade400, size: 32));
              })),
              if (noteDonnee > 0) Text(noteDonnee == 5 ? "Excellent !" : noteDonnee >= 4 ? "Merci !" : "Merci pour ton retour", style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF1A6EBF))),
            ]),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: onTerminer, child: const Text("Terminer"))),
        TextButton(onPressed: onTerminer, child: const Text("Passer la notation")),
      ],
    );
  }
}

// -------- Wallet Passager complet --------
class WalletPassager extends StatelessWidget {
  final int soldeFCFA;
  final DeviseMock devise;
  final Function(DeviseMock) onDeviseChange;
  final String Function(int) formatMontant;
  final Function(int) onSoldeChange;
  const WalletPassager({super.key, required this.soldeFCFA, required this.devise, required this.onDeviseChange, required this.formatMontant, required this.onSoldeChange});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: const Color(0xFF1A6EBF),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Wallet TACO EDEN", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, letterSpacing: 1)), Icon(Icons.visibility, color: Colors.white.withOpacity(0.8), size: 18)]),
              const SizedBox(height: 8),
              Text(formatMontant(soldeFCFA), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30)),
              Text("Solde disponible - ${devise.code} - ${devise.nom}", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11)),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(child: FilledButton.icon(onPressed: () => _showRecharge(context), icon: const Icon(Icons.add), label: const Text("Recharger"))),
                const SizedBox(width: 10),
                Expanded(child: OutlinedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Retrait simule - bientot disponible"))), icon: const Icon(Icons.arrow_upward, color: Colors.white), label: const Text("Retirer", style: TextStyle(color: Colors.white)), style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white54), foregroundColor: Colors.white))),
              ]),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Devise (multi-pays - demo)", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
              const SizedBox(height: 4),
              Text("Conversion simulee sans vraie API de change", style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
              const SizedBox(height: 10),
              SegmentedButton<DeviseMock>(
                segments: devisesMock.map((d) => ButtonSegment(value: d, label: Text(d.code), icon: Text(d.symbole))).toList(),
                selected: {devise},
                onSelectionChanged: (s) => onDeviseChange(s.first),
              ),
              const SizedBox(height: 8),
              Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: const Color(0xFFF6F9FC), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade200)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Ex: 3000 FCFA =", style: TextStyle(color: Colors.grey.shade700, fontSize: 12)), Text(formatMontant(3000), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: Color(0xFF1A6EBF)))])),
            ]),
          ),
        ),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Historique transactions", style: TextStyle(fontWeight: FontWeight.w800)), Text("${transactionsMock.length} operations", style: TextStyle(color: Colors.grey.shade600, fontSize: 11))]),
        const SizedBox(height: 8),
        ...transactionsMock.map((t) => Card(
              child: ListTile(
                leading: CircleAvatar(backgroundColor: t.montant > 0 ? Colors.green.shade50 : Colors.red.shade50, child: Icon(t.icone, size: 18, color: t.montant > 0 ? Colors.green.shade700 : Colors.red.shade700)),
                title: Text(t.libelle, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                subtitle: Text(t.date, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                trailing: Text("${t.montant > 0 ? '+' : ''}${formatMontant(t.montant.abs())}", style: TextStyle(fontWeight: FontWeight.w800, color: t.montant > 0 ? Colors.green.shade700 : Colors.red.shade700, fontSize: 12)),
              ),
            )),
      ],
    );
  }

  void _showRecharge(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Recharger (Simule)"),
        content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Operateur Mobile Money:"),
          const SizedBox(height: 10),
          Row(children: [Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.phone_android, color: Color(0xFFFFCC00)), label: const Text("MTN MoMo"))), const SizedBox(width: 8), Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.phone_android, color: Colors.orange), label: const Text("Orange Money")))]),
          const SizedBox(height: 12),
          const Text("Montants rapides:", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Annuler")),
          FilledButton(onPressed: () { Navigator.pop(context); onSoldeChange(5000); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recharge simulee +5000 FCFA !"), backgroundColor: Color(0xFF1A6EBF))); }, child: const Text("+5 000")),
          FilledButton(onPressed: () { Navigator.pop(context); onSoldeChange(10000); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Recharge simulee +10 000 FCFA !"))); }, child: const Text("+10 000")),
        ],
      ),
    );
  }
}

// -------- Historique --------
class HistoriquePassager extends StatelessWidget {
  final String Function(int) formatMontant;
  const HistoriquePassager({super.key, required this.formatMontant});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Historique des courses", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        Text("${historiqueMock.length} courses - Douala", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        const SizedBox(height: 12),
        ...historiqueMock.map((c) => Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: c.statut == "Terminee" ? Colors.green.shade50 : Colors.red.shade50, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.statut == "Terminee" ? Colors.green.shade200 : Colors.red.shade200)), child: Text(c.statut, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: c.statut == "Terminee" ? Colors.green.shade700 : Colors.red.shade700))), Text(c.date, style: TextStyle(color: Colors.grey.shade600, fontSize: 11))]),
                  const SizedBox(height: 10),
                  Row(children: [const Icon(Icons.trip_origin, size: 12, color: Color(0xFF2DB872)), const SizedBox(width: 6), Text(c.depart, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), const Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Icon(Icons.arrow_forward, size: 12)), Text(c.arrivee, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))]),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(formatMontant(c.prix), style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1A6EBF))), Row(children: List.generate(5, (i) => Icon(i < c.note ? Icons.star : Icons.star_border, size: 14, color: Colors.amber.shade700)))]),
                ]),
              ),
            )),
      ],
    );
  }
}

class ProfilPassager extends StatelessWidget {
  const ProfilPassager({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(16), children: [
      const CircleAvatar(radius: 40, backgroundColor: Color(0xFF1A6EBF), child: Icon(Icons.person, size: 40, color: Colors.white)),
      const SizedBox(height: 12),
      const Center(child: Text("Raphaela M.", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18))),
      Center(child: Text("Passager - Douala - Membre depuis Jan 2026", style: TextStyle(color: Colors.grey.shade600, fontSize: 12))),
      const SizedBox(height: 16),
      Card(child: Column(children: [ListTile(leading: const Icon(Icons.phone), title: const Text("Telephone"), subtitle: const Text("+237 6 XX XX XX XX (fictif)"), trailing: const Icon(Icons.verified, color: Colors.green)), const Divider(height: 1), ListTile(leading: const Icon(Icons.shield), title: const Text("Credit d'urgence"), subtitle: const Text("Ã‰ligible - Plafond 3000 FCFA"))])),
      const SizedBox(height: 12),
      Card(child: ListTile(leading: const Icon(Icons.help_outline), title: const Text("Support & Securite"), subtitle: const Text("SOS, signalement, assistance 24/7 (simule)"))),
    ]);
  }
}

// ============================================================
// SECTION 6 - MODE CHAUFFEUR
// ============================================================

class ChauffeurRoot extends StatefulWidget {
  final int index;
  const ChauffeurRoot({super.key, required this.index});
  @override
  State<ChauffeurRoot> createState() => _ChauffeurRootState();
}

class _ChauffeurRootState extends State<ChauffeurRoot> {
  bool enLigne = true;
  String creneau = "Jour (06h-18h)";
  bool courseEntranteVisible = true;
  int countdown = 15;
  Timer? timerCountdown;
  String statutCourse = "aucune"; // aucune, entrante, enCours, terminee
  double gainsMois = 187500;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    timerCountdown?.cancel();
    countdown = 15;
    timerCountdown = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!enLigne || statutCourse != "aucune") { t.cancel(); return; }
      setState(() {
        countdown--;
        if (countdown <= 0) {
          courseEntranteVisible = false;
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() { timerCountdown?.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    if (widget.index == 1) {
      // Ecran course en cours
      return ListView(padding: const EdgeInsets.all(16), children: [
        const Text("Course en cours", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        const SizedBox(height: 12),
        CarteSimulee(hauteur: 200, showCar: true, progression: statutCourse == "enCours" ? 0.6 : 0.2, depart: "Deido", arrivee: "Bonapriso"),
        const SizedBox(height: 12),
        Card(child: ListTile(leading: const CircleAvatar(child: Icon(Icons.person)), title: const Text("Cliente: Marie L.", style: TextStyle(fontWeight: FontWeight.w700)), subtitle: const Text("Deido â†’ Bonapriso - 2800 FCFA - Paiement Wallet"))),
        const SizedBox(height: 12),
        if (statutCourse == "aucune" || statutCourse == "entrante") ...[
          const Card(child: Padding(padding: EdgeInsets.all(16), child: Text("Aucune course en cours. Accepte une course entrante depuis l'onglet Disponibilite.", style: TextStyle(color: Colors.grey)))),
        ] else if (statutCourse == "enCours") ...[
          SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => setState(() => statutCourse = "terminee"), icon: const Icon(Icons.flag), label: const Text("Terminer la course"))),
          const SizedBox(height: 8),
          SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passager Ã  bord confirme"))), icon: const Icon(Icons.check), label: const Text("Passager Ã  bord"))),
        ] else ...[
          Card(color: Colors.green.shade50, child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [Icon(Icons.check_circle, color: Colors.green.shade700, size: 40), const SizedBox(height: 8), const Text("Course terminee ! +2800 FCFA credites", style: TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 8), FilledButton(onPressed: () => setState(() => statutCourse = "aucune"), child: const Text("Retour disponibilite"))]))),
        ]
      ]);
    }
    if (widget.index == 2) {
      return ListView(padding: const EdgeInsets.all(16), children: [
        Card(color: const Color(0xFF1A6EBF), child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Gains du mois", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)), Text("${gainsMois.toInt()} FCFA", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 28)), Text("AoÃ»t 2026 - 34 courses", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11))]))),
        const SizedBox(height: 12),
        const Text("Detail des courses", style: TextStyle(fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        ...historiqueMock.take(5).map((c) => Card(child: ListTile(title: Text("${c.depart} â†’ ${c.arrivee}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), subtitle: Text(c.date, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)), trailing: Text("+${c.prix} FCFA", style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF2DB872)))))),
        const SizedBox(height: 12),
        Card(child: Padding(padding: const EdgeInsets.all(14), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Commission VTC (15%)", style: TextStyle(color: Colors.grey.shade600)), const Text("-28 125 FCFA")]))),
      ]);
    }
    // Index 0 : disponibilite
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Disponibilite", style: TextStyle(fontWeight: FontWeight.w800)), Switch(value: enLigne, onChanged: (v) { setState(() { enLigne = v; if (v) { courseEntranteVisible = true; _startCountdown(); } }); }, activeColor: const Color(0xFF2DB872))]),
          Row(children: [Icon(enLigne ? Icons.circle : Icons.circle_outlined, size: 10, color: enLigne ? Colors.green : Colors.grey), const SizedBox(width: 6), Text(enLigne ? "En ligne - Visible pour les passagers" : "Hors ligne - Invisible", style: TextStyle(color: enLigne ? Colors.green.shade700 : Colors.grey.shade600, fontWeight: FontWeight.w600, fontSize: 12))]),
          const SizedBox(height: 12),
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFF6F9FC), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)), child: Row(children: [const Icon(Icons.schedule, size: 18, color: Color(0xFF1A6EBF)), const SizedBox(width: 8), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Creneau assigne", style: TextStyle(color: Colors.grey.shade600, fontSize: 11)), Text(creneau, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13))]), const Spacer(), DropdownButton<String>(value: creneau, underline: const SizedBox(), items: const [DropdownMenuItem(value: "Jour (06h-18h)", child: Text("Jour")), DropdownMenuItem(value: "Nuit (18h-06h)", child: Text("Nuit"))], onChanged: (v) => setState(() => creneau = v!))]))])),
        ),
        const SizedBox(height: 12),
        if (enLigne && courseEntranteVisible && statutCourse == "aucune")
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Icon(Icons.notifications_active, color: Colors.orange.shade800, size: 18), const SizedBox(width: 6), Text("Course entrante !", style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.w900))]), Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.orange.shade800, borderRadius: BorderRadius.circular(20)), child: Text("$countdown s", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)))]),
                const SizedBox(height: 10),
                const Text("Passager: Marie L. - â­ 4.8", style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text("Deido â†’ Bonapriso - 6.2 km - 18 min", style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                const Text("Prix: 3200 FCFA - Paiement Wallet", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: Color(0xFF1A6EBF))),
                const SizedBox(height: 12),
                LinearProgressIndicator(value: countdown / 15, color: Colors.orange.shade800, backgroundColor: Colors.orange.shade100),
                const SizedBox(height: 12),
                Row(children: [Expanded(child: OutlinedButton(onPressed: () { setState(() { courseEntranteVisible = false; }); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Course refusee")) ); _startCountdown(); }, child: const Text("Refuser"))), const SizedBox(width: 10), Expanded(child: FilledButton(onPressed: () { setState(() { statutCourse = "enCours"; courseEntranteVisible = false; gainsMois += 3200; }); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Course acceptee ! Direction Deido")) ); }, child: const Text("Accepter")))]),
              ]),
            ),
          )
        else if (!enLigne)
          const Card(child: Padding(padding: EdgeInsets.all(24), child: Center(child: Text("Tu es hors ligne. Passe en ligne pour recevoir des courses.", style: TextStyle(color: Colors.grey))))),
        const SizedBox(height: 12),
        Card(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Aujourd'hui", style: TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 8), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Courses", style: TextStyle(color: Colors.grey.shade600)), const Text("5", style: TextStyle(fontWeight: FontWeight.w700))]), const Divider(height: 16), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Gains", style: TextStyle(color: Colors.grey.shade600)), const Text("14 200 FCFA", style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF2DB872)))]), const Divider(height: 16), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Note moyenne", style: TextStyle(color: Colors.grey.shade600)), Row(children: [Icon(Icons.star, size: 14, color: Colors.amber.shade700), const Text(" 4.9", style: TextStyle(fontWeight: FontWeight.w700))])])]))),
      ],
    );
  }
}

// ============================================================
// SECTION 7 - MODE ADMIN (SIMPLIFIE)
// ============================================================

class AdminRoot extends StatelessWidget {
  final int index;
  const AdminRoot({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Chauffeurs", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          Text("${chauffeursMock.length} chauffeurs - Douala", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          const SizedBox(height: 12),
          ...chauffeursMock.map((c) => Card(
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: c.couleurAvatar, child: Icon(c.icone, color: Colors.white, size: 18)),
                  title: Text(c.nom, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                  subtitle: Text("${c.vehicule} - ${c.plaque} - ${c.creneau}", style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                  trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: c.actif ? Colors.green.shade50 : Colors.grey.shade200, borderRadius: BorderRadius.circular(20), border: Border.all(color: c.actif ? Colors.green.shade200 : Colors.grey.shade300)), child: Text(c.actif ? "Actif" : "Inactif", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: c.actif ? Colors.green.shade700 : Colors.grey.shade600))),
                    const SizedBox(height: 4),
                    Text("â­ ${c.note} - ${c.coursesDuJour} courses", style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                  ]),
                ),
              )),
        ],
      );
    }
    if (index == 2) {
      final alertes = [
        {"titre": "Ã‰cart kilometrique detecte", "desc": "Vehicule 3 - LT 3421 CE - +4.2 km vs trajet optimal", "time": "Il y a 12 min", "color": Colors.orange},
        {"titre": "SOS passager", "desc": "Course #VTC-8891 - Bonapriso - Intervention en cours", "time": "Il y a 34 min", "color": Colors.red},
        {"titre": "Paiement echoue", "desc": "Wallet insuffisant - Passager A. - Credit d'urgence propose", "time": "Il y a 1h", "color": Colors.blue},
        {"titre": "Chauffeur hors zone", "desc": "Emmanuel T. - Sortie de Douala signalee", "time": "Il y a 2h", "color": Colors.purple},
      ];
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Alertes systeme", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          Text("${alertes.length} alertes actives", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          const SizedBox(height: 12),
          ...alertes.map((a) => Card(
                child: ListTile(
                  leading: CircleAvatar(backgroundColor: (a["color"] as Color).withOpacity(0.12), child: Icon(Icons.warning_amber, color: a["color"] as Color, size: 18)),
                  title: Text(a["titre"] as String, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(a["desc"] as String, style: TextStyle(color: Colors.grey.shade700, fontSize: 11)), const SizedBox(height: 4), Text(a["time"] as String, style: TextStyle(color: Colors.grey.shade500, fontSize: 10))]),
                  trailing: TextButton(onPressed: () {}, child: const Text("Voir", style: TextStyle(fontSize: 11))),
                ),
              )),
        ],
      );
    }
    // Dashboard
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Tableau de bord - Douala", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        Text("20 AoÃ»t 2026 - Donnees fictives temps reel (simule)", style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.45,
          children: [
            _statCard("Courses du jour", "127", "+12% vs hier", Icons.route, const Color(0xFF1A6EBF)),
            _statCard("Chauffeurs actifs", "18 / 24", "75% en ligne", Icons.local_taxi, const Color(0xFF2DB872)),
            _statCard("Revenus du jour", "342 500 FCFA", "Commission 15% incluse", Icons.payments, const Color(0xFF2DB872)),
            _statCard("Note moyenne", "4.8 / 5", "312 avis aujourd'hui", Icons.star, Colors.amber.shade700),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Repartition par creneau", style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF2DB872), shape: BoxShape.circle)), const SizedBox(width: 6), const Text("Jour", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12))]), const SizedBox(height: 4), Text("14 chauffeurs - 82 courses", style: TextStyle(color: Colors.grey.shade600, fontSize: 11))])), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF1A6EBF), shape: BoxShape.circle)), const SizedBox(width: 6), const Text("Nuit", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12))]), const SizedBox(height: 4), Text("10 chauffeurs - 45 courses", style: TextStyle(color: Colors.grey.shade600, fontSize: 11))]))]),
              const SizedBox(height: 12),
              ClipRRect(borderRadius: BorderRadius.circular(99), child: LinearProgressIndicator(value: 0.65, minHeight: 8, backgroundColor: const Color(0xFF1A6EBF), color: const Color(0xFF2DB872))),
            ]),
          ),
        ),
      ],
    );
  }

  static Widget _statCard(String titre, String valeur, String sousTitre, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 18, color: color)), Icon(Icons.trending_up, size: 14, color: Colors.green.shade600)]),
          const Spacer(),
          Text(valeur, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: color)),
          Text(titre, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
          Text(sousTitre, style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
        ]),
      ),
    );
  }
}

// ============================================================
// SECTION 8 - WIDGET CARTE SIMULEE (SANS GOOGLE MAPS)
// ============================================================

class CarteSimulee extends StatelessWidget {
  final double hauteur;
  final bool showCar;
  final double progression;
  final bool showRoute;
  final String? depart;
  final String? arrivee;
  const CarteSimulee({super.key, required this.hauteur, this.showCar = false, this.progression = 0, this.showRoute = false, this.depart, this.arrivee});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hauteur,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFE8F5E9), Color(0xFFDCEDC8), Color(0xFFBBDEFB)]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Quadrillage simulant rues
            Positioned.fill(child: CustomPaint(painter: _GrillePainter())),
            // Zones
            Positioned(left: 16, top: 16, child: _zoneLabel("AKWA")),
            Positioned(right: 16, top: 40, child: _zoneLabel("BONAPRISO")),
            Positioned(left: 40, bottom: 30, child: _zoneLabel("DEIDO")),
            Positioned(right: 40, bottom: 16, child: _zoneLabel("MAKEPE")),
            // Route simulee
            if (showRoute || showCar)
              Positioned.fill(
                child: CustomPaint(painter: _RoutePainter(progression: showCar ? progression : 1)),
              ),
            // Points A et B
            Positioned(left: 30, top: hauteur / 2 - 10, child: _pointA()),
            Positioned(right: 30, top: hauteur / 2 - 10, child: _pointB()),
            // Vehicule anime
            if (showCar)
              Positioned(
                left: 30 + (MediaQuery.of(context).size.width - 64 - 60) * progression,
                top: hauteur / 2 - 14 + (progression < 0.5 ? progression * 20 : (1 - progression) * 20),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: const Color(0xFF1A6EBF), borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 2))]),
                  child: const Icon(Icons.local_taxi, color: Colors.white, size: 16),
                ),
              ),
            // Legende carte fictive
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade300)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.map, size: 12, color: Colors.grey.shade700), const SizedBox(width: 4), Text("Carte simulee - Douala (demo)", style: TextStyle(fontSize: 9, color: Colors.grey.shade700, fontWeight: FontWeight.w600))]),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                child: Column(children: [Icon(Icons.add, size: 12, color: Colors.grey.shade700), Container(height: 1, width: 12, color: Colors.grey.shade300, margin: const EdgeInsets.symmetric(vertical: 2)), Icon(Icons.remove, size: 12, color: Colors.grey.shade700)]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _zoneLabel(String label) => Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.white.withOpacity(0.85), borderRadius: BorderRadius.circular(6), border: Border.all(color: Colors.grey.shade300)), child: Text(label, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: Colors.grey.shade700, letterSpacing: 0.5)));

  Widget _pointA() => Column(children: [Container(width: 12, height: 12, decoration: BoxDecoration(color: const Color(0xFF2DB872), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4)])), const SizedBox(height: 2), Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), decoration: BoxDecoration(color: const Color(0xFF2DB872), borderRadius: BorderRadius.circular(4)), child: const Text("A", style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w800)))]);

  Widget _pointB() => Column(children: [Container(width: 12, height: 12, decoration: BoxDecoration(color: const Color(0xFF2DB872), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4)])), const SizedBox(height: 2), Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), decoration: BoxDecoration(color: const Color(0xFF2DB872), borderRadius: BorderRadius.circular(4)), child: const Text("B", style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w800)))]);
}

// Peintre quadrillage
class _GrillePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.5)..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 40) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += 40) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    // Riviere simulee (Wouri)
    final river = Paint()..color = const Color(0xFF90CAF9).withOpacity(0.35)..style = PaintingStyle.stroke..strokeWidth = 14..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(0, size.height * 0.7)..quadraticBezierTo(size.width * 0.3, size.height * 0.6, size.width * 0.6, size.height * 0.75)..quadraticBezierTo(size.width * 0.8, size.height * 0.85, size.width, size.height * 0.8);
    canvas.drawPath(path, river);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Peintre route
class _RoutePainter extends CustomPainter {
  final double progression;
  _RoutePainter({required this.progression});
  @override
  void paint(Canvas canvas, Size size) {
    final base = Paint()..color = Colors.white.withOpacity(0.9)..style = PaintingStyle.stroke..strokeWidth = 8..strokeCap = StrokeCap.round;
    final trace = Paint()..color = const Color(0xFF1A6EBF)..style = PaintingStyle.stroke..strokeWidth = 3..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(36, size.height / 2)..cubicTo(size.width * 0.3, size.height * 0.3, size.width * 0.6, size.height * 0.7, size.width - 36, size.height / 2);
    canvas.drawPath(path, base);
    // Portion parcourue (pour l'animation)
    final metrics = path.computeMetrics().first;
    final extract = metrics.extractPath(0, metrics.length * progression);
    canvas.drawPath(extract, trace..color = const Color(0xFF2DB872));
    // Pointilles
    final dash = Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = 2;
    for (double i = 0; i < 1; i += 0.08) {
      final pos = metrics.getTangentForOffset(metrics.length * i);
      if (pos != null) canvas.drawCircle(pos.position, 1.2, dash);
    }
  }
  @override
  bool shouldRepaint(covariant _RoutePainter oldDelegate) => oldDelegate.progression != progression;
}




