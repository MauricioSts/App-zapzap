import 'package:app_zapzap/Home.dart';
import 'package:app_zapzap/Screens/Config.dart';
import 'package:app_zapzap/Screens/Login.dart';
import 'package:app_zapzap/Screens/Register.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Login());
      case "/login":
        return MaterialPageRoute(builder: (_) => Login());
      case "/register":
        return MaterialPageRoute(builder: (_) => Register());
      case "/home":
        return MaterialPageRoute(builder: (_) => Home());
      case "/config":
        return MaterialPageRoute(builder: (_) => Config());
      default:
        return _erroRota(); // <- Aqui foi corrigido
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text("Tela não encontrada")),
          body: Center(child: Text("Tela não encontrada")),
        );
      },
    );
  }
}
