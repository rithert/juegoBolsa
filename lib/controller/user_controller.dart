import 'package:practica/models/BalanceModel.dart';
import 'package:practica/models/RondaEndedModel.dart';
import 'package:practica/models/ScoresModel.dart';
import 'package:practica/models/TurnoModel.dart';
import 'package:practica/models/UserModel.dart';
import 'package:practica/services/user_services.dart';
import 'package:practica/session/sesion_usuario.dart';

class UserController {
  static Future<UserModel?> autenticar(
    String email,
    String pass,
  ) async {
    Map<String, dynamic> jsonConsulta =
        await UserService.autenticarServices(email, pass);

    if (jsonConsulta.containsKey("token")) {
      UserModel user = UserModel.fromJson(jsonConsulta);
      SesionUsuarioSingleton().token = user.token;
      SesionUsuarioSingleton().nombres = user.name;
      SesionUsuarioSingleton().idAccount = user.accountId;
      return user;
    }
    return null;
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

  static Future<RondaEndModel?> nextTurno(TurnoModel turno) async {
    Map<String, dynamic> jsonConsulta =
        await UserService.userTurnoServices(turno);

    if (jsonConsulta.containsKey("data")) {
      RondaEndModel ronda = RondaEndModel.fromJson(jsonConsulta["data"]);
      return ronda;
    }
    return null;
  }

  static Future<BalanceModel> getBalance() async {
    Map<String, dynamic> jsonConsulta = await UserService.getBalanceServices();

    BalanceModel balance = BalanceModel.fromJson(jsonConsulta);

    return balance;
  }

  static Future<ScoresModel> getScores(String id) async {
    Map<String, dynamic> jsonConsulta =
        await UserService.getGanadoresServices(id);

    ScoresModel scores = ScoresModel.fromJson(jsonConsulta["data"]);

    return scores;
  }
}
