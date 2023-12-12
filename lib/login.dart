import 'package:EnWaWi/Premierepage.dart';
import 'package:EnWaWi/singup.dart';
import 'package:EnWaWi/welcome.dart';
import 'package:flutter/material.dart';
import 'package:EnWaWi/agro.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _countryCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
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
            image: AssetImage('assets/images/elo.jpg'),
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _countryCodeController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Indicatif pays',
                            prefixIcon: Icon(Icons.map, color: Colors.brown),
                            labelStyle: TextStyle(color: Colors.brown),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            prefixText: '+',
                            prefixStyle: TextStyle(color: Colors.brown),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer l\'indicatif du pays';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
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
                    child: const Text('Se connecter'),
                  ),
                  const SizedBox(height: 16.0),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Logique de connexion avec Facebook
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                      primary: Colors.blue,
                      onSurface: Colors.white,
                    ),
                    icon: const Icon(Icons.facebook),
                    label: const Text('Connectez-vous avec Facebook'),
                  ),
                  const SizedBox(height: 8.0),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Logique de connexion avec Google
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      primary: Colors.red,
                      onSurface: Colors.white,
                    ),
                    icon: const Icon(Icons.g_mobiledata),
                    label: const Text('Connectez-vous avec Google'),
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      // Logique d'inscription
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
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
