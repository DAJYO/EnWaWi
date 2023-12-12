import 'dart:io';
import 'package:EnWaWi/AnalyzePhotoPage.dart';
import 'package:EnWaWi/agro.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoPage extends StatefulWidget {
  const TakePhotoPage({Key? key}) : super(key: key);

  @override
  State<TakePhotoPage> createState() => _TakePhotoPageState();
}

enum AppState { clear, picking, picked, cropped }

class _TakePhotoPageState extends State<TakePhotoPage> {
  bool isLoading = false;
  AppState state = AppState.clear;
  File? mainImageFile;
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logoTPE (1).png',
              height: 60,
              width: 60,
            ),
            const SizedBox(width: 4),
            const Text(
              'EnWaWi',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'AutofillHints.familyName',
              ),
            ),
          ],
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Agro()),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/travailleur-campagne-poussant-brouette-arachides.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              color: Colors.white,
              height: 200,
              child: isLoading
                  ? Text('Loading...')
                  : mainImageFile != null
                      ? Image.file(
                          mainImageFile!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                        ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () async {
                      // --- Pick Gallery
                      _pickImage(ImageSource.gallery);
                    },
                    child: const Text('Galerie'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () {
                      // --- Take Photo
                      _pickImage(ImageSource.camera);
                    },
                    child: const Text('Prendre une Photo'),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    setState(() {
      isLoading = true;
    });

    try {
      final picked = await imagePicker.pickImage(source: source);

      if (picked != null) {
        setState(() {
          mainImageFile = File(picked.path);
          isLoading = false;
          _navigateToAnalysisPage();
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToAnalysisPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnalyzePhotoPage(imageFile: mainImageFile!),
      ),
    );
  }
}
