import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lifepet_app/models/usuario_model.dart';


class SecureStorageUtil {
  final FlutterSecureStorage storage = new FlutterSecureStorage();


  Future<void> inserir(Usuario usuario) async {
    storage.write(key: usuario.email,
        value: usuario.senha);
  }

  Future<Map<String, dynamic>> getUsuarios() async {
    print(storage.read(key: "asda22s@mail.com").then((value) {
      print(value);
    }));
  }

  // Future<Map<String, dynamic>> getUsuario(String email) async {
  //   storage.read(key: email).then((value) {
  //     print(value);
  //   }));
  // }

  Future<bool> login(String email, String senha) async {
    await storage.read(key: email).then((value) {
      if (value == senha) {
        print("ae");
      } else {
        print("nae");
      }
    });
  }
}