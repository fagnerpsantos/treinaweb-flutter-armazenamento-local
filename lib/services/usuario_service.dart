
import 'package:lifepet_app/models/usuario_model.dart';
import 'package:lifepet_app/utils/file_util.dart';

class UsuarioService {
  void addUsuario(Usuario usuario){
    final newUsuario = Usuario(
      email: usuario.email,
      senha: usuario.senha,
    );
    FileUtil.inserir(newUsuario);
  }
}