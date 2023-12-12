import 'package:flutter/material.dart';

class CommentairesPage extends StatefulWidget {
  @override
  _CommentairesPageState createState() => _CommentairesPageState();
}

class _CommentairesPageState extends State<CommentairesPage> {
  // Liste des commentaires (vous pouvez la remplacer par une source de données)
  List<String> commentaires = [
    'Commentaire 1',
    'Commentaire 2',
    'Commentaire 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Commentaires'),
      ),
      body:  ListView.builder(
        itemCount: commentaires.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(commentaires[index]),
            // Vous pouvez ajouter d'autres informations ici
            
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _modifierCommentaire(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ajouterCommentaire,
        child: Icon(Icons.add),
      ),
      
    );
  }

  // Fonction pour modifier un commentaire
  void _modifierCommentaire(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String nouveauCommentaire = commentaires[index];
        return AlertDialog(
          title: Text('Modifier le commentaire'),
          content: TextField(
            onChanged: (nouveauTexte) {
              nouveauCommentaire = nouveauTexte;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  commentaires[index] = nouveauCommentaire;
                });
                Navigator.pop(context);
              },
              child: Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }

  // Fonction pour ajouter un nouveau commentaire
  void _ajouterCommentaire() {
    showDialog(
      context: context,
      builder: (context) {
        String nouveauCommentaire = '';
        return AlertDialog(
          title: Text('Ajouter un commentaire'),
          content: TextField(
            onChanged: (nouveauTexte) {
              nouveauCommentaire = nouveauTexte;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  commentaires.add(nouveauCommentaire);
                });
                Navigator.pop(context);
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }
}
