import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lifepet_app/models/usuario_model.dart';


class SecureStorageUtil {
  final FlutterSecureStorage storage = new FlutterSecureStorage();


  Future<void> inserir(Usuario usuario) async {
    String data = json.encode(usuario.toSecureMap());
    storage.write(key: usuario.id.toString(),
        value: data);
    // print("secure");
    // print(await storage.read(key: usuario.id.toString()));

  }

  Future<void> getUsuarios() async {
    print(await storage.readAll());
  }
}