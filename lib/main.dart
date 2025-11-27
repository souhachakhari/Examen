import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main() {
  runApp(const AtlasGeoApp());
}

class AtlasGeoApp extends StatelessWidget {
  const AtlasGeoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlas Géographique',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomePage(),
    );
  }
}