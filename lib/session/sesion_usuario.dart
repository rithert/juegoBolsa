class SesionUsuarioSingleton {
  // Atributo para guardar el token de la sesión
  String nombres = '';
  String idAccount = '';
  String email = '';
  String token = '';

  // Variable privada que almacena la instancia
  static final SesionUsuarioSingleton _instancia =
      SesionUsuarioSingleton._internal();

  // Constructor factory que devuelve la instancia
  factory SesionUsuarioSingleton() {
    return _instancia;
  }

  // Constructor privado que solo se llama una vez
  SesionUsuarioSingleton._internal();
}
