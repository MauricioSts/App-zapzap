import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:app_zapzap/Screens/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Teste opcional (remover depois)
  // await FirebaseFirestore.instance.collection("usuarios").doc("001").set({
  //   "Nome": "Mauricio",
  // });

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZapZap',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Login(),
    ),
  );
}
