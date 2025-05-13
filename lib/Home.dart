import 'package:app_zapzap/Screens/Contatos.dart';
import 'package:app_zapzap/Screens/Conversas.dart';
import 'package:app_zapzap/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
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

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  void initState() {
    _recuperarDadosUsuarios();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> itensMenu = ["Configurações", "logout"];

  _escolhaMenuItem(String itemEscolhido) {
    if (itemEscolhido == "logout") {
      logOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("zap"),
        actions: [
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(value: item, child: Text(item));
              }).toList();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: "Conversas"), Tab(text: "Contatos")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [Conversas(), const Contatos()],
      ),
    );
  }
}
