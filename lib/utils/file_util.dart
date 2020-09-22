import 'dart:convert';
import 'dart:io';
import 'package:lifepet_app/models/usuario_model.dart';
import 'package:path_provider/path_provider.dart';


class FileUtil {
  static Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/usuarios.json");
  }

  static Future<File> inserir(Usuario usuario) async {
    String dataUser = json.encode(usuario.toUserMap());

    final file = await getFile();
    return file.writeAsString(dataUser + '\n',
        mode: FileMode.append);
  }

  static Future<List<String>> getUsuarios() async {
    final file = await getFile();
    print("arquivo");
    print(file.readAsString().then((value) =>
        print(value)
    ));
  }
}