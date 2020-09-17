import 'dart:math';

import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/utils/db_util.dart';

class PetService {
  List<Pet> _petList = [];

  static final PetService _singleton = PetService._internal();

  factory PetService() {
    return _singleton;
  }

  PetService._internal() {
//    _petList.add(Pet(
//        nome: "Totó",
//        imageUrl: 'assets/images/toto.png',
//        descricao: "Um cachorro esperto",
//        idade: 2,
//        sexo: "Macho",
//        cor: "Preto",
//        bio: "Sou um totó bem esperto",
//        id: "1"
//    ));
//    _petList.add(Pet(
//        nome: "Arnaldo",
//        imageUrl: 'assets/images/arnaldo.png',
//        descricao: "Um pinsher elétrico",
//        idade: 3,
//        sexo: "Macho",
//        cor: "Preto",
//        bio: "Sou um pinsher elétrico",
//        id: "2"
//    ));
  }

  Future<List> getAllPets() async {
    final dataList = await DbUtil.getData('pets');
    _petList = dataList.map((pets) => Pet(
      id: pets['id'],
      nome: pets['nome'],
      imageUrl: pets['imageUrl'],
      descricao: pets['descricao'],
      idade: pets['idade'],
      sexo: pets['sexo'],
      cor: pets['cor'],
      bio: pets['bio']
    )).toList();
    return _petList;
  }

  void addPet(Pet pet){
    final newPet = Pet(
      nome: pet.nome,
      bio: pet.bio,
      idade: pet.idade,
      sexo: pet.sexo,
      descricao: pet.descricao,
      cor: pet.cor,
      imageUrl: 'assets/images/toto.png',
    );
    DbUtil.inserir('pets', newPet.toMap());
    print("inseriu");
  }

//  void editPet(String id, Pet newPet) {
//    Pet petEditar = getPet(id);
//    petEditar.nome = newPet.nome;
//    petEditar.descricao = newPet.descricao;
//    petEditar.idade = newPet.idade;
//    petEditar.sexo = newPet.sexo;
//    petEditar.cor = newPet.cor;
//    petEditar.bio = newPet.bio;
//  }

  Future<Pet> getPet(int id) async {
    List<String> columnsToSelect = [
      "id",
      "nome",
      "idade",
      "imageUrl",
      "descricao",
      "sexo",
      "cor",
      "bio",
    ];
    String whereString = "$id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataId("pets", columnsToSelect, whereString, whereArguments);
    return Pet.fromMap(dataList.first);
  }

//  Future<Pet> getPet(int id) async {
//    Database dbContact = await db;
//    List<Map> maps = await dbContact.query(contactTable,
//        columns: [idColumn, nameColumn, emailColumn, phoneColumn, imgColumn],
//        where: "$idColumn = ?",
//        whereArgs: [id]);
//    if(maps.length > 0){
//      return Contact.fromMap(maps.first);
//    } else {
//      return null;
//    }
//  }
}