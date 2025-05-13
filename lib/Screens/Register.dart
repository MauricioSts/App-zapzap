
import 'package:app_zapzap/models/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  String _mensagemErro = "";

  void _validarCampors() {
    String nome = _nome.text;
    String email = _email.text;
    String senha = _senha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty) {
          setState(() {
            _mensagemErro = "";

            Usuario usuario = Usuario();
            usuario.nome = nome;
            usuario.email = email;
            usuario.senha = senha;

            _cadastrarUsuario(usuario);
          });
        } else {
          setState(() {
            _mensagemErro = "Preencha a senha";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o email corretamente";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o nome";
      });
    }
  }

  void _cadastrarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
          email: usuario.email,
          password: usuario.senha,
        )
        .then((firebaseUser) {
          FirebaseFirestore db = FirebaseFirestore.instance;
          db
              .collection("usuarios")
              .doc(firebaseUser.user!.uid)
              .set(usuario.toMap());

          Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
        })
        .catchError((error) {
          setState(() {
            _mensagemErro = "ERRO AO CADASTRAR";
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      backgroundColor: Colors.green,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/usuario.png", height: 120),
              const SizedBox(height: 40),
              TextFormField(
                controller: _nome,

                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2),
                  labelText: "Nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _senha,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    _validarCampors();
                  },
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(_mensagemErro, style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
