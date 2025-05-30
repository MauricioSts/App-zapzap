import 'package:app_zapzap/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZapZap',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
