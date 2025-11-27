import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'data/countries_data.dart';
import 'models/country.dart';
import 'country_detail_page.dart';
import 'about_page.dart';
import 'welcome_page.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb if needed for SystemNavigator

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  late Future<List<Country>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    // Try to load from JSON; fallback to hardcoded
    _countriesFuture = _loadCountries();
  }

  Future<List<Country>> _loadCountries() async {
    try {
      final String data = await rootBundle.loadString('assets/data/pays_info.json');
      final List<dynamic> jsonList = json.decode(data);
      return jsonList.map((json) => Country.fromJson(json)).toList();
    } catch (e) {
      // Fallback to hardcoded if JSON not found
      return getCountries();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Pays'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // En-tête du Drawer avec icône/image
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueGrey],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.public,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Atlas Géographique',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            // Option Accueil
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text(
                'Accueil',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              },
            ),
            
            // Option À propos
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text(
                'À propos',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            
            const Divider(),
            
            // Option Quitter
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                'Quitter',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Quitter l\'application'),
                    content: const Text(
                      'Voulez-vous vraiment quitter l\'application ?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          if (kIsWeb) {
                            // For web, just pop the route or show message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Fermeture de l\'application')),
                            );
                          } else {
                            SystemNavigator.pop();
                          }
                        },
                        child: const Text(
                          'Quitter',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Country>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          final countries = snapshot.data ?? [];
          return ListView.builder(
            itemCount: countries.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Text(
                    getFlagEmoji(country.nom),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                title: Text(
                  country.nom,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryDetailPage(country: country),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}