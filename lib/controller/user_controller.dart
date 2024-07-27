import 'package:practica/models/UserModel.dart';
import 'package:practica/services/user_services.dart';

class UserController {
  static Future<dynamic> autenticar(
    String email,
    String pass,
  ) async {
    Map<String, dynamic> jsonConsulta =
        await UserService.autenticarServices(email, pass);

    if (jsonConsulta.containsKey("token")) {
      UserModel user = UserModel.fromJson(jsonConsulta);
      return user;
    } else {
      return jsonConsulta;
    }
  }

  static Future<dynamic> crearCuenta(
    String email,
    String pass,
    String name,
  ) async {
    Map<String, dynamic> jsonConsulta =
        await UserService.crearCuentaServices(email, pass, name);

    if (jsonConsulta.containsKey("token")) {
      UserModel user = UserModel.fromJson(jsonConsulta);
      return user;
    } else {
      return jsonConsulta;
    }
  }
}
