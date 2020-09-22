class Usuario {
  String nome;
  String email;
  String senha;
  int id;

  Usuario({
    this.nome,
    this.email,
    this.senha,
    this.id
  });


  Map<String, dynamic> toUserMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  Map<String, dynamic> toSecureMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
    };
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        email = json['email'] as String,
        nome = json['nome'] as String,
        senha = json['senha'] as String;

}