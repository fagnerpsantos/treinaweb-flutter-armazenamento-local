import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/pet/form_pet_screen.dart';
import 'package:lifepet_app/services/pet_service.dart';
import 'package:lifepet_app/screens/pet/components/custom_navbar.dart';

class PerfilPetScreen extends StatefulWidget {
  final int id;

  PerfilPetScreen({this.id});

  @override
  _PerfilPetScreenState createState() => _PerfilPetScreenState();
}
class _PerfilPetScreenState extends State<PerfilPetScreen> {

  PetService service = PetService();
  Pet pet;

  Future<Pet> _loadPet;

  @override
  void initState() {
    // TODO: implement initState
    _loadPet = _getPet(widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadPet,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.hasData) {
            pet = snapshot.data;
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Hero(
                          tag: pet.id,
                          child: Container(
                            width: double.infinity,
                            height: 350,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        pet.imageUrl
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40, left: 10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            pet.nome,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            pet.descricao,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _cartaoInfoPet('Idade', pet.idade.toString()),
                          _cartaoInfoPet('Sexo', pet.sexo.toString()),
                          _cartaoInfoPet('Cor', pet.cor.toString()),
                          _cartaoInfoPet('ID', pet.id.toString()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                      child: Text(
                        pet.bio,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            height: 1.5
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FormPetScreen(id: pet.id.toString()),
                    ),
                  );
                },
                child: Icon(
                    Icons.edit
                ),
                backgroundColor: Colors.redAccent,
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomNavbar(paginaAberta: 0, pet: pet,),
            );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        );
  }

  Widget _cartaoInfoPet(String label, String informacao) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
          color: Color(0xFFF8F2F7),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red
            ),
          ),
          SizedBox(height: 8,),
          Text(
            informacao,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }

  Future<Pet> _getPet(int id) async {
     return await service.getPet(id);
  }
}
