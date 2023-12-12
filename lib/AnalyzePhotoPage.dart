import 'dart:io';
import 'package:flutter/material.dart';

class AnalyzePhotoPage extends StatelessWidget {
  final File imageFile;

  const AnalyzePhotoPage({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analyse de Photo'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/travailleur-campagne-poussant-brouette-arachides.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.black12.withOpacity(0.7), // Réduire l'opacité pour voir l'image en arrière-plan
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showAnalysisDialog(context);
                  },
                  child: const Text('Lancer l\'Analyse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAnalysisDialog(BuildContext context) {
    String plantHealthStatus = 'Bonne santé';

    // Logique simulée d'analyse (remplacez par votre propre logique)
    if (imageFile.path.contains('mildew')) {
      plantHealthStatus = 'Plante malade (Mildiou)';
    } else if (imageFile.path.contains('threat')) {
      plantHealthStatus = 'En menace de maladie';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('État de santé de la plante'),
          content: Text('Analyse réussie. État de santé : $plantHealthStatus.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
