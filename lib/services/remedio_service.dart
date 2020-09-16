import 'dart:math';

import 'package:lifepet_app/models/remedio_model.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/utils/db_util.dart';


class RemedioService{
  List<Remedio> _remedioList = [];
  final PetService petService = PetService();

  static final RemedioService _singleton = RemedioService._internal();

  factory RemedioService() {
    return _singleton;
  }

  RemedioService._internal(){
    _remedioList.add(Remedio(
      nome: "Remédio X",
      data: "10/10/2020",
      id: "123",
      pet: petService.getPet("1")
    ));
  }

  List getRemediosPet(String id) {
    return _remedioList.where((remedio) {
      return remedio.pet.id == id;
    }).toList();
  }

  Future<List> getAllRemedios() async {
    final dataList = await DbUtil.getData('remedios');
    _remedioList = dataList.map((remedios) => Remedio(
        id: remedios['id'],
        nome: remedios['nome'],
        data: remedios['data'],
        pet: remedios['pet'],
    )).toList();
    print(_remedioList[4].pet);
    return _remedioList;
  }

  void addRemedio(Remedio remedio) {
    final newRemedio = Remedio(
      nome: remedio.nome,
      data: remedio.data,
      pet: remedio.pet
    );
    DbUtil.inserir('remedios', newRemedio.toMap());

  }
}