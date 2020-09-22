import 'dart:math';

import 'package:lifepet_app/models/usuario_model.dart';
import 'package:lifepet_app/utils/file_util.dart';
import 'package:lifepet_app/utils/secure_storage_util.dart';

class UsuarioService {
  Random random = new Random();

  void addUsuario(Usuario usuario){
    SecureStorageUtil ss = new SecureStorageUtil();
    final newUsuario = Usuario(
      id: random.nextInt(1000),
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
    );
    FileUtil.inserir(newUsuario);
    ss.inserir(newUsuario);
    ss.getUsuarios();
  }

  void getUsuarios(){
    FileUtil.getUsuarios();

  }
}