import 'package:app_zapzap/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:app_zapzap/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necessário para usar Firebase antes de runApp
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Firestore atual usa FirebaseFirestore.instance
  await FirebaseFirestore.instance.collection("usuarios").doc("001").set({
    "Nome": "Mauricio",
  });

  runApp(MaterialApp(home: Login()));
}
