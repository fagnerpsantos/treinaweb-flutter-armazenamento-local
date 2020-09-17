import 'package:lifepet_app/models/pet_model.dart';

class Remedio {
  final String nome;
  final String data;
  final String id;
  final int pet;

  Remedio({
    this.nome,
    this.data,
    this.id,
    this.pet
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'pet': pet
    };
  }
}