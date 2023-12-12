import 'package:EnWaWi/agro.dart';
import 'package:EnWaWi/login.dart';
import 'package:EnWaWi/singup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class MyFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn() async {
    try {
      await googleSignIn.signIn();
      // Handle Google sign-in
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  Future<void> _handleFacebookSignIn() async {
    try {
      LoginResult accessToken = await FacebookAuth.instance.login();
      // Handle Facebook sign-in
    } catch (error) {
      print('Facebook Sign-In Error: $error');
    }
  }

  void _navigateToRegistration(BuildContext context) {
    // Naviguer vers la page d'inscription (Agro)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationPage()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logoTPE (1).png', height: 150),
              SizedBox(height: 20),
              Text(
                'EnWaWi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _navigateToRegistration(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                ),
                child: Text('S\'inscrire gratuitement'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleGoogleSignIn,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/google_logo.png', height: 30.0),
                    SizedBox(width: 10),
                    Text('S\'inscrire avec Google'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _handleFacebookSignIn,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF1877f2), // Facebook blue color
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/facebook_logo.png', height: 30.0),
                    SizedBox(width: 10),
                    Text('S\'inscrire avec Facebook'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
                  // Action to perform on 'Se connecter' button press
                  
                },
                child: Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyFirst());
}
