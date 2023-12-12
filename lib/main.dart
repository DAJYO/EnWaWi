import 'package:EnWaWi/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:EnWaWi/welcome.dart';
import 'package:EnWaWi/Premierepage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyFirst(),
      ),
  ));
}

