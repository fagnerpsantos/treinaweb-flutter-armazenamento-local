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

  RemedioService._internal();

  Future<List> getRemedioPet(int id) async {
    String whereString = "pet = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataWhere("remedios", whereString, whereArguments);
    return dataList.map((remedios) => Remedio(
      id: remedios['id'],
      nome: remedios['nome'],
      data: remedios['data'],
      pet: remedios['pet']
    )).toList();
  }

  Future<List> getAllRemedios() async {
    final dataList = await DbUtil.getData('remedios');
    _remedioList = dataList.map((remedios) => Remedio(
        id: remedios['id'],
        nome: remedios['nome'],
        data: remedios['data'],
        pet: remedios['pet'],
    )).toList();
    return _remedioList;
  }

  void addRemedio(Remedio remedio) async {
    final newRemedio = Remedio(
      nome: remedio.nome,
      data: remedio.data,
      pet: remedio.pet
    );
    DbUtil.inserir('remedios', newRemedio.toMap());
  }
}