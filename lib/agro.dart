import 'package:flutter/material.dart';
import 'package:EnWaWi/articles.dart';
import 'package:EnWaWi/learn.dart';
import 'package:EnWaWi/login.dart';
import 'package:EnWaWi/takephoto.dart';

class News {
  final String title;
  final String description;
  final String image;

  News({
    required this.title,
    required this.description,
    required this.image,
  });
}

class Agro extends StatefulWidget {
  const Agro({Key? key}) : super(key: key);

  @override
  State<Agro> createState() => _AgroState();
}

class _AgroState extends State<Agro> {
  final List<News> newsList = [
    News(
      title: 'Agriculture,La voie vers le Developpement',
      description: "L'agriculture, un domaine incontournable pour le developpement d'un pays,en effet ce domaine, est au centre de centaines ",
      image: 'assets/images/11.jpg',
    ),
    News(
      title: 'Le changement climatique,un mal qui entraine la famine',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/001.jpg',
    ),
    News(
      title: 'Actualité climatique 1',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/111.jpg',
    ),
    News(
      title: 'Actualité climatique 1',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/ima1.jpg',
    ),
    News(
      title: 'Actualité climatique,agriculture menacee',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/elo.jpg',
    ),
    News(
      title: 'Actualité climatique 1',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/11.jpg',
    ),
    News(
      title: 'Actualité climatique 1',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/11.jpg',
    ),
    News(
      title: 'Actualité climatique 1',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/11.jpg',
    ),
    News(
      title: 'Actualité climatique 1',
      description: 'Description de l\'actualité climatique 1',
      image: 'assets/images/11.jpg',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
              child: Image.asset(
                'assets/images/logoTPE (1).png',
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: const Text(
                'EnWaWi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AutofillHints.familyName',
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Agro()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                // ... Votre logique de déconnexion ...
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/golden-wheat-fields-glow-sunset-generated-by-ai.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                for (var index = 0; index < newsList.length; index++)
                  _buildNewsCard(newsList[index], context),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TakePhotoPage()),
          );
        },
        child: const Icon(Icons.camera),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArticleWritingPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu_book),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlantDiseaseLearningPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.people),  // Icône représentant une communauté
              onPressed: () {
                // Ajoutez l'action correspondante ici
              },
            ),
            IconButton(
              icon: const Icon(Icons.headset_mic),  // Icône de consultation
              onPressed: () {
                // Ajoutez l'action correspondante ici
              },
            ),
            IconButton(
              icon: const Icon(Icons.location_on),  // Icône de localisation
              onPressed: () {
                // Ajoutez l'action correspondante ici
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(News news, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsPage(news: news),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  news.image,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _truncateDescription(news.description),
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _truncateDescription(String description) {
    const maxLength = 100;
    return description.length > maxLength
        ? '${description.substring(0, maxLength)}...'
        : description;
  }
}

// Exemple de page pour les détails d'une actualité
class NewsDetailsPage extends StatelessWidget {
  final News news;

  const NewsDetailsPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              news.image,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              news.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              news.description,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
