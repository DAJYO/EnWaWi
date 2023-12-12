import 'package:EnWaWi/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'agro.dart';

// Gestionnaire d'état pour gérer l'état de connexion de l'utilisateur
class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

class ArticleWritingPage extends StatefulWidget {
  const ArticleWritingPage({Key? key}) : super(key: key);

  @override
  _ArticleWritingPageState createState() => _ArticleWritingPageState();
}

class _ArticleWritingPageState extends State<ArticleWritingPage> {
  final TextEditingController _articleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Accéder à l'état de connexion
    final isLoggedIn = Provider.of<AuthProvider>(context).isLoggedIn;

    // Vérifier si l'utilisateur est connecté avant d'afficher la page
    if (!isLoggedIn) {
      // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
      return LoginPage();
    }

    // Si l'utilisateur est connecté, afficher la page d'écriture d'articles
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Article'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Agro()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller: _articleController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Write your article here...',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _saveAsPDF(_articleController.text);
                  },
                  child: const Text('Save as PDF'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Simuler le choix d'un fichier dans un projet réel
                    // Actuellement, cela utilise un sélecteur de fichiers fictif
                    // Vous devez utiliser FilePicker pour la sélection réelle de fichiers
                    final content = 'Sample document content...';
                    setState(() {
                      _articleController.text = content;
                    });
                  },
                  child: const Text('Import Document'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Additional logic for saving the article in your app
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveAsPDF(String articleContent) async {
    try {
      // Placeholder for saving as PDF
      // In a real project, you would use a PDF generation library
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Article saved as PDF: $articleContent'),
        ),
      );
    } catch (e) {
      print('Error saving PDF: $e');
    }
  }
}
