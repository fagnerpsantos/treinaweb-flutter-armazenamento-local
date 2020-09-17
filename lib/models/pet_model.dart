class Pet {
  String nome;
  String imageUrl;
  String descricao;
  int idade;
  String sexo;
  String cor;
  String bio;
  int id;

  Pet({
    this.nome,
    this.imageUrl,
    this.descricao,
    this.idade,
    this.sexo,
    this.cor,
    this.bio,
    this.id
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'imageUrl': imageUrl,
      'descricao': descricao,
      'idade': idade,
      'sexo': sexo,
      'cor': cor,
      'bio': bio,
    };
  }

  Pet.fromMap(Map map){
    id = map["id"];
    nome = map["nome"];
    idade = map["idade"];
    imageUrl = map["imageUrl"];
    descricao = map["descricao"];
    sexo = map["sexo"];
    cor = map["cor"];
    bio = map["bio"];
  }

}