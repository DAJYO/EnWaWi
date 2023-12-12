import 'package:EnWaWi/agro.dart';
import 'package:flutter/material.dart';

class PlantDiseaseLearningPage extends StatefulWidget {
  @override
  _PlantDiseaseLearningPageState createState() =>
      _PlantDiseaseLearningPageState();
}

class Disease {
  final String name;
  final String description;
  final String image;

  Disease({
    required this.name,
    required this.description,
    required this.image,
  });
}

class _PlantDiseaseLearningPageState extends State<PlantDiseaseLearningPage> {
  List<Disease> diseases = [
    Disease(
      name: 'Mildiou',
      description: 'Le mildiou est une maladie commune affectant les plantes...',
      image: 'assets/images/mildiou.jpg',
    ),
    Disease(
      name: 'Oïdium',
      description:
          'L\'oïdium est une maladie fongique qui se manifeste par ...',
      image: 'assets/images/oidium.jpg',
    ),
    Disease(
      name: 'Rouille',
      description:
          'La rouille est une maladie des plantes causée par des champignons...',
      image: 'assets/images/rouille.jpeg',
    ),
    Disease(
      name: 'Pourriture des racines',
      description:
          'La pourriture des racines est un problème courant chez de nombreuses plantes...',
      image: 'assets/images/pourriture_racines.jpg',
    ),
    Disease(
      name: 'Chancre bactérien',
      description:
          'Le chancre bactérien est une maladie bactérienne qui affecte les arbres fruitiers...',
      image: 'assets/images/chancre_bacterien.jpeg',
    ),
    Disease(
      name: 'Tache noire des rosiers',
      description:
          'La tache noire est une maladie commune des rosiers causée par le champignon Diplocarpon rosae...',
      image: 'assets/images/tache_noire_rosier.jpeg',
    ),
    Disease(
      name: 'Mosaïque du concombre',
      description:
          'La mosaïque du concombre est une maladie virale qui affecte les plantes de la famille des cucurbitacées...',
      image: 'assets/images/mosaique_concombre.jpeg',
    ),
    Disease(
      name: 'Feu bactérien',
      description:
          'Le feu bactérien est une maladie bactérienne qui affecte les arbres fruitiers de la famille des Rosaceae...',
      image: 'assets/images/feu_bacterien.jpeg',
    ),
    // Ajoutez les autres maladies ici
  ];

  Map<String, bool> expandedState = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apprendre sur les maladies des plantes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: diseases.map((disease) {
            return _buildDiseaseCard(
              disease: disease,
              isExpanded: expandedState[disease.name] ?? false,
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Agro()),
          );
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildDiseaseCard({
    required Disease disease,
    required bool isExpanded,
  }) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                expandedState[disease.name] = !isExpanded;
              });
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(
                disease.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disease.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  disease.description,
                  maxLines: isExpanded ? null : 2,
                  overflow: isExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
