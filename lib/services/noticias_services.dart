import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica/session/sesion_usuario.dart';

class NoticiasServices {
  static Future<Map<String, dynamic>> consultarNoticiasServicios() async {
    try {
      //Construye la URL de la solicitud utilizando UtilHelper.apiUrl y AppConfig.API_DIR
      Uri uri = Uri.https("api-sumulador.rioenvios.com", "/api/news");

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
