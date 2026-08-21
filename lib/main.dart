// ============================================================
// VTC AFRIQUE - MVP Maquette Fonctionnelle - Douala, Cameroun
// 100% Mock Data - Aucun serveur, aucune API externe
// Un seul fichier main.dart - Flutter SDK seul
// Commentaires en français - Material 3
// Choix par défaut: Palette bleu-vert confiance (#0E3A3E) + accent orange (#FF6B35), FCFA par défaut, 5 chauffeurs / 6 courses / 7 transactions
// ============================================================

import 'package:flutter/material.dart';
import 'dart:async';

// ============================================================
// SECTION 1 - MODELES DE DONNEES FICTIVES (MOCK DATA)
// ============================================================

// Modèle chauffeur fictif
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

// Modèle course passée
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

// Modèle transaction wallet
class TransactionMock {
  final String type; // recharge, course, remboursement
  final String libelle;
  final int montant; // positif = crédit, négatif = débit
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

// Modèle devise fictive
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
  const ChauffeurMock(nom: "Jean-Paul E.", note: 4.9, plaque: "LT 3421 CE", vehicule: "Toyota Corolla Blanche", couleurAvatar: Color(0xFF0E3A3E), icone: Icons.person, creneau: "Jour", actif: true, coursesDuJour: 12),
  const ChauffeurMock(nom: "Aïssatou B.", note: 4.8, plaque: "CE 8912 LT", vehicule: "Honda Civic Grise", couleurAvatar: Color(0xFF1B7A6B), icone: Icons.person_3, creneau: "Nuit", actif: true, coursesDuJour: 8),
  const ChauffeurMock(nom: "Samuel K.", note: 4.7, plaque: "NO 1123 AD", vehicule: "Kia Rio Bleue", couleurAvatar: Color(0xFFFF6B35), icone: Icons.person_4, creneau: "Jour", actif: true, coursesDuJour: 10),
  const ChauffeurMock(nom: "Fatima N.", note: 4.9, plaque: "SW 7788 CE", vehicule: "Hyundai i10 Rouge", couleurAvatar: Color(0xFF6C5CE7), icone: Icons.person_2, creneau: "Jour", actif: false, coursesDuJour: 7),
  const ChauffeurMock(nom: "Emmanuel T.", note: 4.6, plaque: "OU 5541 LT", vehicule: "Suzuki Swift Blanche", couleurAvatar: Color(0xFFE17055), icone: Icons.person, creneau: "Nuit", actif: true, coursesDuJour: 15),
];

final List<CourseMock> historiqueMock = [
  CourseMock(depart: "Akwa", arrivee: "Bonapriso", prix: 2800, date: "19 Août 2026, 08:12", note: 5, statut: "Terminée"),
  CourseMock(depart: "Bonamoussadi", arrivee: "Aéroport Douala", prix: 5500, date: "17 Août 2026, 14:30", note: 4, statut: "Terminée"),
  CourseMock(depart: "Deido", arrivee: "Makepe", prix: 1800, date: "15 Août 2026, 18:45", note: 5, statut: "Terminée"),
  CourseMock(depart: "Bali", arrivee: "Akwa", prix: 1500, date: "12 Août 2026, 09:00", note: 4, statut: "Terminée"),
  CourseMock(depart: "Ndokoti", arrivee: "Village", prix: 3200, date: "10 Août 2026, 19:20", note: 5, statut: "Terminée"),
  CourseMock(depart: "Logbaba", arrivee: "Bonaberi", prix: 4000, date: "08 Août 2026, 07:55", note: 3, statut: "Annulée"),
];

final List<TransactionMock> transactionsMock = [
  TransactionMock(type: "recharge", libelle: "Recharge MTN MoMo", montant: 10000, date: "20 Août 2026", icone: Icons.phone_android),
  TransactionMock(type: "course", libelle: "Course Akwa → Bonapriso", montant: -2800, date: "19 Août 2026", icone: Icons.directions_car),
  TransactionMock(type: "recharge", libelle: "Recharge Orange Money", montant: 5000, date: "18 Août 2026", icone: Icons.account_balance_wallet),
  TransactionMock(type: "course", libelle: "Course Bonamoussadi → Aéroport", montant: -5500, date: "17 Août 2026", icone: Icons.directions_car),
  TransactionMock(type: "remboursement", libelle: "Remboursement crédit d'urgence", montant: -1200, date: "16 Août 2026", icone: Icons.shield),
  TransactionMock(type: "course", libelle: "Course Deido → Makepe", montant: -1800, date: "15 Août 2026", icone: Icons.directions_car),
  TransactionMock(type: "recharge", libelle: "Bonus parrainage", montant: 2000, date: "14 Août 2026", icone: Icons.card_giftcard),
];

final List<DeviseMock> devisesMock = [
  DeviseMock(code: "FCFA", nom: "Franc CFA", symbole: "FCFA", tauxVersFCFA: 1),
  DeviseMock(code: "NGN", nom: "Naira Nigérian", symbole: "₦", tauxVersFCFA: 0.75),
  DeviseMock(code: "GHS", nom: "Cedi Ghanéen", symbole: "GH₵", tauxVersFCFA: 0.022),
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
      title: 'VTC Afrique - Douala',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0E3A3E),
          primary: const Color(0xFF0E3A3E),
          secondary: const Color(0xFF1B7A6B),
          tertiary: const Color(0xFFFF6B35),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F7F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0E3A3E),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: const CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)), side: BorderSide(color: Color(0xFFE0E0E0))),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B35),
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
// SECTION 4 - RACINE AVEC SELECTEUR DE ROLE + BOTTOM NAV
// ============================================================

enum RoleApp { passager, chauffeur, admin }

class RacineApp extends StatefulWidget {
  const RacineApp({super.key});
  @override
  State<RacineApp> createState() => _RacineAppState();
}

class _RacineAppState extends State<RacineApp> {
  RoleApp role = RoleApp.passager;
  int indexPassager = 0;
  int indexChauffeur = 0;
  int indexAdmin = 0;

  // Etat global wallet (partagé pour la démo)
  int soldeFCFA = 4200;
  DeviseMock deviseSelectionnee = devisesMock[0];

  // Conversion simulée
  String formatMontant(int montantFCFA) {
    double taux = deviseSelectionnee.tauxVersFCFA;
    if (deviseSelectionnee.code == "FCFA") return "$montantFCFA ${deviseSelectionnee.symbole}";
    double converti = montantFCFA * taux;
    if (deviseSelectionnee.code == "NGN") return "₦${converti.toStringAsFixed(0)}";
    if (deviseSelectionnee.code == "GHS") return "GH₵${converti.toStringAsFixed(2)}";
    return "${converti.toStringAsFixed(0)} ${deviseSelectionnee.code}";
  }

  void ajouterSolde(int montant) {
    setState(() => soldeFCFA += montant);
  }

  void debiterSolde(int montant) {
    setState(() => soldeFCFA -= montant);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VTC Afrique • Douala", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: Container(
            color: const Color(0xFF0E3A3E),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  _buildRoleChip("Passager", Icons.person, RoleApp.passager),
                  _buildRoleChip("Chauffeur", Icons.local_taxi, RoleApp.chauffeur),
                  _buildRoleChip("Admin", Icons.admin_panel_settings, RoleApp.admin),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildRoleChip(String label, IconData icon, RoleApp r) {
    final selected = role == r;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => role = r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: selected ? const Color(0xFF0E3A3E) : Colors.white70),
              const SizedBox(width: 6),
              Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: selected ? const Color(0xFF0E3A3E) : Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (role) {
      case RoleApp.passager:
        return PassagerRoot(
          index: indexPassager,
          soldeFCFA: soldeFCFA,
          devise: deviseSelectionnee,
          onDeviseChange: (d) => setState(() => deviseSelectionnee = d),
          formatMontant: formatMontant,
          onSoldeChange: (delta) {
            if (delta > 0) {
              ajouterSolde(delta);
            } else {
              debiterSolde(-delta);
            }
          },
        );
      case RoleApp.chauffeur:
        return ChauffeurRoot(index: indexChauffeur);
      case RoleApp.admin:
        return AdminRoot(index: indexAdmin);
    }
  }

  Widget? _buildBottomNav() {
    switch (role) {
      case RoleApp.passager:
        return NavigationBar(
          selectedIndex: indexPassager,
          onDestinationSelected: (i) => setState(() => indexPassager = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: "Accueil"),
            NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: "Wallet"),
            NavigationDestination(icon: Icon(Icons.history), selectedIcon: Icon(Icons.history), label: "Historique"),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: "Profil"),
          ],
        );
      case RoleApp.chauffeur:
        return NavigationBar(
          selectedIndex: indexChauffeur,
          onDestinationSelected: (i) => setState(() => indexChauffeur = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.toggle_on_outlined), selectedIcon: Icon(Icons.toggle_on), label: "Disponibilité"),
            NavigationDestination(icon: Icon(Icons.route), selectedIcon: Icon(Icons.route), label: "Course"),
            NavigationDestination(icon: Icon(Icons.payments_outlined), selectedIcon: Icon(Icons.payments), label: "Gains"),
          ],
        );
      case RoleApp.admin:
        return NavigationBar(
          selectedIndex: indexAdmin,
          onDestinationSelected: (i) => setState(() => indexAdmin = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: "Dashboard"),
            NavigationDestination(icon: Icon(Icons.groups_outlined), selectedIcon: Icon(Icons.groups), label: "Chauffeurs"),
            NavigationDestination(icon: Icon(Icons.warning_amber_outlined), selectedIcon: Icon(Icons.warning), label: "Alertes"),
          ],
        );
    }
  }
}

// ============================================================
// SECTION 5 - MODE PASSAGER
// ============================================================

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
    if (widget.index == 1) return WalletPassager(soldeFCFA: widget.soldeFCFA, devise: widget.devise, onDeviseChange: widget.onDeviseChange, formatMontant: widget.formatMontant, onSoldeChange: widget.onSoldeChange);
    if (widget.index == 2) return HistoriquePassager(formatMontant: widget.formatMontant);
    if (widget.index == 3) return const ProfilPassager();

    switch (etape) {
      case EtapePassager.accueil:
        return const EcranPlaceholder("Accueil Passager");
      case EtapePassager.estimation:
        return const EcranPlaceholder("Estimation");
      case EtapePassager.walletCheck:
        return const EcranPlaceholder("Vérification Wallet");
      case EtapePassager.suivi:
        return const EcranPlaceholder("Suivi Course");
      case EtapePassager.fin:
        return const EcranPlaceholder("Fin Course");
    }
  }
}

class EcranPlaceholder extends StatelessWidget {
  final String titre;
  const EcranPlaceholder(this.titre, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(titre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
  }
}

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
          color: const Color(0xFF0E3A3E),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Wallet VTC Afrique", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, letterSpacing: 1)),
              const SizedBox(height: 8),
              Text(formatMontant(soldeFCFA), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 30)),
              Text("Solde disponible • ${devise.code} - ${devise.nom}", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11)),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(child: FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text("Recharger"))),
                const SizedBox(width: 10),
                Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_downward), label: const Text("Retrait"))),
              ]),
            ]),
          ),
        ),
      ],
    );
  }
}

class HistoriquePassager extends StatelessWidget {
  final String Function(int) formatMontant;
  const HistoriquePassager({super.key, required this.formatMontant});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Historique des courses", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        Text("${historiqueMock.length} courses • Douala", style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}

class ProfilPassager extends StatelessWidget {
  const ProfilPassager({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(16), children: [
      const CircleAvatar(radius: 40, backgroundColor: Color(0xFF0E3A3E), child: Icon(Icons.person, size: 40, color: Colors.white)),
      const SizedBox(height: 12),
      const Center(child: Text("Raphaela M.", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18))),
      Center(child: Text("Passager • Douala • Membre depuis Jan 2026", style: TextStyle(color: Colors.grey.shade600, fontSize: 12))),
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const Text("Mode Chauffeur", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SwitchListTile(value: enLigne, onChanged: (v) => setState(() => enLigne = v), title: const Text("En ligne"), subtitle: Text(creneau)),
            ]),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// SECTION 7 - MODE ADMIN
// ============================================================

class AdminRoot extends StatefulWidget {
  final int index;
  const AdminRoot({super.key, required this.index});
  @override
  State<AdminRoot> createState() => _AdminRootState();
}

class _AdminRootState extends State<AdminRoot> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const Text("Mode Admin", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text("Chauffeurs actifs: ${chauffeursMock.where((c) => c.actif).length}", style: const TextStyle(fontSize: 14)),
              Text("Courses totales: ${historiqueMock.length}", style: const TextStyle(fontSize: 14)),
            ]),
          ),
        ),
      ],
    );
  }
}
