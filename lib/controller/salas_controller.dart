import 'package:practica/models/salasModel.dart';
import 'package:practica/services/salas_services.dart';

class SalasController {
  static Future<List<SalasModel>> consultarSalas() async {
    Map<String, dynamic> jsonConsulta = await SalasServices.listarSalas();

    List<dynamic> listaSalas = jsonConsulta['data'];
    List<SalasModel> listSala = listaSalas
        .map((jsonObject) => SalasModel.fromJson(jsonObject))
        .toList();
    return listSala;
  }
}
