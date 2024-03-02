class ClienteDTO{
  final String identificacion;
  final String? companiaId;
  final String? nombre;
  final String? apellido;
  final String? razonSocial;
  final String? tipoIdentificacionId;
  final String? direccion;
  final String? email;
  final String? telefono;
  final bool? enabled;
  
  const ClienteDTO(
      {
      required this.identificacion,
      this.companiaId,
      this.nombre,
      this.apellido,
      this.razonSocial,
      this.tipoIdentificacionId,
      this.direccion,
      this.email,
      this.telefono,
      this.enabled});

  // Método para convertir el objeto ClienteDTO a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'identificacion': identificacion,
      'companiaId': companiaId,
      'nombre': nombre,
      'apellido': apellido,
      'razonSocial': razonSocial,
      'tipoIdentificacionId': tipoIdentificacionId,
      'direccion': direccion,
      'email': email,
      'telefono': telefono,
      'enabled': enabled,
    };
  }

  // Método para crear un objeto ClienteDTO a partir de un mapa (JSON)
  factory ClienteDTO.fromJson(Map<String, dynamic> json) {
    return ClienteDTO(
      identificacion: json['identificacion'],
      companiaId: json['companiaId'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      razonSocial: json['razonSocial'],
      tipoIdentificacionId: json['tipoIdentificacionId'],
      direccion: json['direccion'],
      email: json['email'],
      telefono: json['telefono'],
      enabled: json['enabled'],
    );
  }
}
