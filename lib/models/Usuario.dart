class Usuario {
  String _nome = "";
  String _email = "";
  String _senha = "";

  // Construtor opcional
  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"nome": nome, "email": email};
    return map;
  }

  // Getter e Setter para nome
  String get nome => _nome;
  set nome(String valor) {
    _nome = valor;
  }

  // Getter e Setter para email
  String get email => _email;
  set email(String valor) {
    _email = valor;
  }

  // Getter e Setter para senha
  String get senha => _senha;
  set senha(String valor) {
    _senha = valor;
  }
}
