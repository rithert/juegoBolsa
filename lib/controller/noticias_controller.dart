import 'package:practica/models/NoticiasModel.dart';
import 'package:practica/services/noticias_services.dart';

class NoticiasController {
  static Future<List<NoticiasModel>> consultarNews() async {
    Map<String, dynamic> jsonConsulta =
        await NoticiasServices.consultarNoticiasServicios();

    List<dynamic> listaNoticias = jsonConsulta['data'];

    List<NoticiasModel> listNews = listaNoticias
        .map((jsonObject) => NoticiasModel.fromJson(jsonObject))
        .toList();

    return listNews;
  }
}
