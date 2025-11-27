import 'package:flutter/material.dart';
import 'models/country.dart';
import '../data/countries_data.dart';

class CountryDetailPage extends StatelessWidget {
  final Country country;

  const CountryDetailPage({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(country.nom, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Drapeau en grand format (light blue background to match screenshot)
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xFFE3F2FD), // Light blue background
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/flags/${country.nom.toLowerCase().replaceAll(' ', '_')}.png',
                  height: 180,
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      getFlagEmoji(country.nom),
                      style: const TextStyle(fontSize: 120),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Titre du pays
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                country.nom,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Informations détaillées (horizontal layout: value left, title right)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.location_city,
                    value: country.capitale,
                    title: 'Capitale',
                  ),
                  _buildInfoCard(
                    icon: Icons.people,
                    value: '${country.population} millions d\'habitants',
                    title: 'Population',
                  ),
                  _buildInfoCard(
                    icon: Icons.map,
                    value: '${country.superficie} km²',
                    title: 'Superficie',
                  ),
                  _buildInfoCard(
                    icon: Icons.language,
                    value: country.langues,
                    title: 'Langue officielle',
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String value,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icon left
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.grey.shade600,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Value on the left (bold, takes more space)
            Expanded(
              flex: 2,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            // Title on the right (grey, aligned right)
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}