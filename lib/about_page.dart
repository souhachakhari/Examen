import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              
              // Icône principale
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.public,
                  size: 100,
                  color: Colors.blue.shade700,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Nom de l'application
              const Text(
                'Atlas Géographique',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 10),
              
              // Version
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Description
              const Text(
                'Application mobile présentant un atlas géographique interactif permettant de consulter les informations de différents pays du monde.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Fonctionnalités
              _buildFeatureItem(
                icon: Icons.explore,
                text: 'Exploration de 9 pays',
              ),
              _buildFeatureItem(
                icon: Icons.info_outline,
                text: 'Informations détaillées',
              ),
              _buildFeatureItem(
                icon: Icons.flag,
                text: 'Drapeaux des pays',
              ),
              _buildFeatureItem(
                icon: Icons.touch_app,
                text: 'Interface intuitive',
              ),
              
              const SizedBox(height: 40),
              
              const Divider(),
              
              const SizedBox(height: 20),
              
              // Développeur
              const Text(
                'Développée par',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const SizedBox(height: 10),
              
              const Text(
                'Souha', // Replace with actual prenom
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              
              const SizedBox(height: 10),
              
              const Text(
                'Enseignant : Wahid Hamdi',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Copyright
              const Text(
                '© 2025 Atlas Géographique',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}