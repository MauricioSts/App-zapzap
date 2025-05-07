import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _emailUser = "";

  Future _recuperarDadosUsuarios() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = auth.currentUser;

    if (usuarioLogado != null) {
      setState(() {
        _emailUser = usuarioLogado.email ?? "Email não disponível";
      });
    } else {
      setState(() {
        _emailUser = "Usuário não autenticado";
      });
    }
  }

  @override
  void initState() {
    _recuperarDadosUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(_emailUser)));
  }
}
