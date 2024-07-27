import 'package:practica/models/EmpresaModel.dart';
import 'package:practica/services/empresas_services.dart';

class EmpresasController {
  static Future<List<EmpresaModel>> consultarEmpresas() async {
    Map<String, dynamic> jsonConsulta =
        await EmpresasServices.consultarempresasServicios();

    List<dynamic> listaEmpresas = jsonConsulta['data'];

    List<EmpresaModel> listCompany = listaEmpresas
        .map((jsonObject) => EmpresaModel.fromJson(jsonObject))
        .toList();

    return listCompany;
  }
}
