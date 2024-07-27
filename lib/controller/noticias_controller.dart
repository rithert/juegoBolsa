import 'package:practica/models/NoticiasModel.dart';
import 'package:practica/services/noticias_services.dart';

class NoticiasController {
  static Future<List<Noticias>> consultarNews() async {
    Map<String, dynamic> jsonConsulta =
        await NoticiasServices.consultarNoticiasServicios();

    List<dynamic> listaNoticias = jsonConsulta['data'];

    List<Noticias> listNews = listaNoticias
        .map((jsonObject) => Noticias.fromJson(jsonObject))
        .toList();

    return listNews;
  }
}
