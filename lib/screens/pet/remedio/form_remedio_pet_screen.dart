import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/models/remedio_model.dart';
import 'package:lifepet_app/screens/pet/remedio/remedio_screen.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/services/remedio_service.dart';

class FormRemedioPetScreen extends StatefulWidget {
  int id;

  FormRemedioPetScreen({this.id});

  @override
  _FormRemedioPetScreenState createState() => _FormRemedioPetScreenState();
}

class _FormRemedioPetScreenState extends State<FormRemedioPetScreen> {
  final _nomeController = TextEditingController();

  final _dataController = TextEditingController();

  final PetService petService = PetService();

  final RemedioService remedioService = RemedioService();

  Pet pet;

  Future<Pet> _loadPet;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      _loadPet = _getPet(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadPet,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            pet = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text("Cadastro de remédio do ${pet.nome}"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          controller: _nomeController,
                          keyboardType: TextInputType.text,
                          decoration:
                              InputDecoration(labelText: "Nome do remédio"),
                        ),
                        TextFormField(
                          controller: _dataController,
                          keyboardType: TextInputType.datetime,
                          decoration:
                              InputDecoration(labelText: "Data do remédio"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                            height: 40,
                            child: RaisedButton(
                              onPressed: () {
                                Remedio novoRemedio = Remedio(
                                    nome: _nomeController.text,
                                    data: _dataController.text,
                                    pet: pet.id);
                                remedioService.addRemedio(novoRemedio);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => RemedioScreen(id: pet.id),
                                  ),
                                );
                              },
                              color: Colors.redAccent,
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<Pet> _getPet(int id) async {
    return await petService.getPet(id);
  }
}
