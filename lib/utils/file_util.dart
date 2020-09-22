

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
    String data = json.encode(usuario.toMap());

    final file = await getFile();
    return file.writeAsString(data + '\n',
        mode: FileMode.append);
  }

  static Future<String> readData() async {
    try {
      final file = await getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}