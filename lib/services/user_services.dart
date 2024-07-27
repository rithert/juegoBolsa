import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static Future<Map<String, dynamic>> autenticarServices(
    String email,
    String pass,
  ) async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrl y AppConfig.API_DIR
      Uri uri = Uri.http("api-sumulador.rioenvios.com", "/api/auth");

      Map<String, String> data = {
        "email": email,
        "password": pass,
      };
      print("Data ${data}");
      //Realiza una solicitud HTTP POST a la URL construida con los encabezados adecuados
      final response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          body: jsonEncode(data));

      //Verifica el código de estado de la respuesta para determinar si la solicitud fue exitosa
      print('Response body: ${response.statusCode}');
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
      Uri uri = Uri.http("api-sumulador.rioenvios.com/api/", "account");

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
        print(jsonDecode(utf8.decode(response.bodyBytes)));
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
