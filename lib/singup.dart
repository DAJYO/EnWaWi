import 'package:flutter/material.dart';
import 'package:EnWaWi/welcome.dart';
import 'package:EnWaWi/Premierepage.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _selectedUserRole = 'Choisir'; // Valeur par défaut
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Ajouter la logique d'inscription ici
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
        backgroundColor: Colors.green[700],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyFirst()),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/212.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green[200]?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 80.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              labelText: 'Prénom',
                              prefixIcon: Icon(Icons.person, color: Colors.brown),
                              labelStyle: TextStyle(color: Colors.brown),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre prénom';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            decoration: const InputDecoration(
                              labelText: 'Nom',
                              prefixIcon: Icon(Icons.person, color: Colors.brown),
                              labelStyle: TextStyle(color: Colors.brown),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre nom';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _countryCodeController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Indicatif pays',
                            labelStyle: TextStyle(color: Colors.brown),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            prefixIcon: Icon(Icons.map, color: Colors.brown),
                            prefixText: '+', // Préfixe initial du texte
                            prefixStyle: TextStyle(color: Colors.brown),
                          ),
                          inputFormatters: [
                            // Utiliser un masque pour autoriser uniquement trois chiffres
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer l\'indicatif du pays';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Numéro de téléphone',
                            prefixIcon: Icon(Icons.phone, color: Colors.brown),
                            labelStyle: TextStyle(color: Colors.brown),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                          ),
                          inputFormatters: [
                            // Utiliser un masque pour autoriser uniquement des chiffres
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre numéro de téléphone';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 60.0,
                    child: DropdownButtonFormField<String>(
                      value: _selectedUserRole,
                      items: ['Choisir', 'Étudiant', 'Agriculteur', 'Conseiller en culture', 'Jardinier']
                          .map((String role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedUserRole = newValue!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Lequel de ces énoncés vous décrit ?',
                        prefixIcon: Icon(Icons.person, color: Colors.brown),
                        labelStyle: TextStyle(color: Colors.brown),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner une option';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail, color: Colors.brown),
                      labelStyle: TextStyle(color: Colors.brown),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      prefixIcon: Icon(Icons.lock, color: Colors.brown),
                      labelStyle: TextStyle(color: Colors.brown),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[700],
                      onPrimary: Colors.white,
                    ),
                    child: const Text('S\'inscrire'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
