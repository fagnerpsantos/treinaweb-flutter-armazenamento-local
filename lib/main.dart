import 'package:flutter/material.dart';
import 'package:lifepet_app/models/pet_model.dart';
import 'package:lifepet_app/screens/cadastro_usuario/form_usuario_screen.dart';
import 'package:lifepet_app/screens/home/home_screen.dart';
import 'package:lifepet_app/screens/pet/form_edit_pet_screen.dart';
import 'package:lifepet_app/screens/login/login_screen.dart';
import 'package:lifepet_app/screens/pet/remedio/remedio_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pet Life",
      home: FormUsuarioScreen(),
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
