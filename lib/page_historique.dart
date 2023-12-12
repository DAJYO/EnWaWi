import 'package:flutter/material.dart';

class HistoriqueMaladiesPlantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des Maladies des Plantes'),
      ),
      body:  Container(
         decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/212.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue dans l\'historique des maladies des plantes!',
              style: TextStyle(fontSize: 18),
            ),
            // Ajoutez ici le contenu spécifique de votre historique des maladies des plantes
          ],
        ),
      ),
    );
  }
}
