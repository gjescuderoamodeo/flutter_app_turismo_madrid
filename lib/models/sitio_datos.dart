class Sitio {
  final String nombre;
  final String ubicacion;
  final String horario;
  final String comerCercano;

  Sitio({
    required this.nombre,
    required this.ubicacion,
    required this.horario,
    required this.comerCercano,
  });

  factory Sitio.fromJson(Map<String, dynamic> json) => Sitio(
        nombre: (json['Nombre del sitio'] ?? 'Sin nombre').toString(),
        ubicacion: (json['Ubicación'] ?? 'Sin ubicación').toString(),
        horario: (json['Horario habitual abierto'] ?? 'Sin horario').toString(),
        comerCercano: (json['Comer cercano'] ?? 'Sin información').toString(),
      );
}
