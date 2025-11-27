import 'package:flutter/material.dart';
import 'countries_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atlas Géographique'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF0A0A0A), // Dark navy/black background to match screenshot
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image de bienvenue - Globe terrestre (using asset as per pubspec.yaml)
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5DC), // Beige circle background
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/globe.png',
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to icon if asset fails (e.g., file missing)
                    return const Icon(
                      Icons.public,
                      size: 150,
                      color: Colors.blue,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),
            
            // Texte de bienvenue
            const Text(
              'Découvrez les pays du monde',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            
            // Bouton Explorer (simple text to match screenshot)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CountriesPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Explorer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}