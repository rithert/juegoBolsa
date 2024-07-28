import 'package:practica/models/EmpresaModel.dart';
import 'package:practica/models/UserModel.dart';
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

  static Future<List<EmpresaModel>> consultarEmpresasBySala(
      String idSala) async {
    Map<String, dynamic> jsonConsulta =
        await EmpresasServices.consultarEmpresasBySalaServices(idSala);

    List<dynamic> listaEmpresas = jsonConsulta['data'];

    List<EmpresaModel> listCompany = listaEmpresas
        .map((jsonObject) => EmpresaModel.fromJson(jsonObject))
        .toList();

    return listCompany;
  }
}
