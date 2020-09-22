class Usuario {
  String email;
  String senha;
  int id;

  Usuario({
    this.email,
    this.senha,
    this.id
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
    };
  }

  Usuario.fromMap(Map map){
    id = map["id"];
    email = map["email"];
    senha = map["senha"];
  }

}