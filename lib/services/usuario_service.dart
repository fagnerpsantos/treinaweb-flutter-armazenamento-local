import 'dart:math';

import 'package:lifepet_app/models/usuario_model.dart';
import 'package:lifepet_app/utils/file_util.dart';
import 'package:lifepet_app/utils/secure_storage_util.dart';

class UsuarioService {
  Random random = new Random();
  SecureStorageUtil _secureStorage = new SecureStorageUtil();
  List<Usuario> _usuarioList = [];

  void addUsuario(Usuario usuario){
    final newUsuario = Usuario(
      id: random.nextInt(1000),
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
    );
    _secureStorage.getUsuarios();
    FileUtil.getUsuario(usuario.email).then((value) {
      if (value == null) {
        FileUtil.inserir(newUsuario);
        _secureStorage.inserir(newUsuario);
      } else {
        print("email já existe");
      }
    }
    );
  }

  void getUsuarios(){
    FileUtil.getUsuarios();
  }

  Future<bool> loginUsuario(String email, String senha) async {
    _secureStorage.login(email, senha);
  }
}