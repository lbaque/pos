class EntidadConst {
  static List<MapEntry<String, String>> ipoIdentificacion() {
    return [
      const MapEntry("04", "RUC"),
      const MapEntry("05","Cédula"),
      const MapEntry("06","Pasaporte"),
      const MapEntry("07","Venta Consumidor Final"),
      const MapEntry("08","Identificación del exterior")
    ];
  }
  static const String email = "sin@correo.com";

  static List<String> sexo() {
    return ["MASCULINO", "FEMENINO"];
  }
}