import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica/models/TurnoModel.dart';
import 'package:practica/session/sesion_usuario.dart';

class UserService {
  static Future<Map<String, dynamic>> autenticarServices(
    String email,
    String pass,
  ) async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrl y AppConfig.API_DIR
      Uri uri = Uri.https("api-sumulador.rioenvios.com", "/api/auth");

      Map<String, String> data = {
        "email": email,
        "password": pass,
      };

      //Realiza una solicitud HTTP POST a la URL construida con los encabezados adecuados
      final response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: jsonEncode(data));

      //Verifica el código de estado de la respuesta para determinar si la solicitud fue exitosa

      if (response.statusCode == 200) {
        //Decodifica y devulve el cuerpo de la respuesta si el código de estado es 200

        return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 408) {
        //Devulve un mensaje de error si el código de estado es 408 (timeout)
        return {
          'strMensajeError': "Tiempo de espera agotado (${response.statusCode})"
        };
      } else {
        return {'strMensajeError': 'Error en la red (${response.statusCode})'};
      }
    } catch (e) {
      return {'strMensajeError': 'Fallo en la conexión'};
    }
  }

  static Future<Map<String, dynamic>> crearCuentaServices(
    String email,
    String pass,
    String name,
  ) async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrl y AppConfig.API_DIR
      Uri uri = Uri.https("api-sumulador.rioenvios.com/api/", "account");

      Map<String, String> data = {
        "email": email,
        "password": pass,
        "name": name
      };
      //Realiza una solicitud HTTP POST a la URL construida con los encabezados adecuados
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'Accept': '*/*',
          "Access-Control-Allow-Origin": "*",
        },
        body: jsonEncode(data),
      );

      //Verifica el código de estado de la respuesta para determinar si la solicitud fue exitosa
      if (response.statusCode == 200) {
        //Decodifica y devulve el cuerpo de la respuesta si el código de estado es 200
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 408) {
        //Devulve un mensaje de error si el código de estado es 408 (timeout)
        return {
          'strMensajeError': "Tiempo de espera agotado (${response.statusCode})"
        };
      } else {
        return {'strMensajeError': 'Error en la red (${response.statusCode})'};
      }
    } catch (e) {
      return {'strMensajeError': 'Fallo en la conexión'};
    }
  }

  static Future<Map<String, dynamic>> userTurnoServices(
      TurnoModel turno) async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrinitl y AppConfig.API_DIR
      Uri uri = Uri.https("api-sumulador.rioenvios.com", "/api/game/init");

      //Realiza una solicitud HTTP POST a la URL construida con los encabezados adecuados
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'Accept': '*/*',
          "Access-Control-Allow-Origin": "*",
          "Authorization": "Bearer ${SesionUsuarioSingleton().token}"
        },
        body: jsonEncode(turno),
      );

      //Verifica el código de estado de la respuesta para determinar si la solicitud fue exitosa

      if (response.statusCode == 200) {
        //Decodifica y devulve el cuerpo de la respuesta si el código de estado es 200
        print("data12 ${jsonDecode(utf8.decode(response.bodyBytes))}");
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 408) {
        //Devulve un mensaje de error si el código de estado es 408 (timeout)
        return {
          'strMensajeError': "Tiempo de espera agotado (${response.statusCode})"
        };
      } else {
        return {'strMensajeError': 'Error en la red (${response.statusCode})'};
      }
    } catch (e) {
      return {'strMensajeError': 'Fallo en la conexión'};
    }
  }

  static Future<Map<String, dynamic>> getBalanceServices() async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrinitl y AppConfig.API_DIR
      Uri uri =
          Uri.https("api-sumulador.rioenvios.com", "/api/user_details/balance");

      //Realiza una solicitud HTTP POST a la URL construida con los encabezados adecuados
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'Accept': '*/*',
          "Access-Control-Allow-Origin": "*",
          "Authorization": "Bearer ${SesionUsuarioSingleton().token}"
        },
      );

      //Verifica el código de estado de la respuesta para determinar si la solicitud fue exitosa

      if (response.statusCode == 200) {
        //Decodifica y devulve el cuerpo de la respuesta si el código de estado es 200
        print("data ${jsonDecode(utf8.decode(response.bodyBytes))}");
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 408) {
        //Devulve un mensaje de error si el código de estado es 408 (timeout)
        return {
          'strMensajeError': "Tiempo de espera agotado (${response.statusCode})"
        };
      } else {
        return {'strMensajeError': 'Error en la red (${response.statusCode})'};
      }
    } catch (e) {
      return {'strMensajeError': 'Fallo en la conexión'};
    }
  }

  static Future<Map<String, dynamic>> getGanadoresServices(
      String idSala) async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrinitl y AppConfig.API_DIR
      Uri uri = Uri.https("api-sumulador.rioenvios.com", "/api/game/results");

      Map<String, dynamic> data = {
        "papers_rent_fixed_id": idSala,
      };
      //Realiza una solicitud HTTP POST a la URL construida con los encabezados adecuados
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'Accept': '*/*',
          "Access-Control-Allow-Origin": "*",
          "Authorization": "Bearer ${SesionUsuarioSingleton().token}"
        },
        body: jsonEncode(data),
      );

      //Verifica el código de estado de la respuesta para determinar si la solicitud fue exitosa

      if (response.statusCode == 200) {
        //Decodifica y devulve el cuerpo de la respuesta si el código de estado es 200
        print("data ${jsonDecode(utf8.decode(response.bodyBytes))}");
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 408) {
        //Devulve un mensaje de error si el código de estado es 408 (timeout)
        return {
          'strMensajeError': "Tiempo de espera agotado (${response.statusCode})"
        };
      } else {
        return {'strMensajeError': 'Error en la red (${response.statusCode})'};
      }
    } catch (e) {
      return {'strMensajeError': 'Fallo en la conexión'};
    }
  }
}
