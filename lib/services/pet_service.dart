import 'dart:math';

import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/utils/db_util.dart';

class PetService {
  List<Pet> _petList = [];

  static final PetService _singleton = PetService._internal();

  factory PetService() {
    return _singleton;
  }

  PetService._internal();

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

  void editPet(int id, Pet pet) async {
    final newPet = Pet(
      id: id,
      nome: pet.nome,
      bio: pet.bio,
      idade: pet.idade,
      sexo: pet.sexo,
      descricao: pet.descricao,
      cor: pet.cor,
      imageUrl: 'assets/images/toto.png',
    );
    print(newPet.sexo);
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editar("pets", newPet.toMap(), whereString, whereArguments);
    print("editou");
  }

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
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataId("pets", columnsToSelect, whereString, whereArguments);
    return Pet.fromMap(dataList.first);
  }
}