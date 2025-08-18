import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/models.dart';

Future<List<Sitio>> loadSitios() async {
  final String jsonString =
      await rootBundle.loadString('assets/data/sitios.json');
  final List<dynamic> jsonData = json.decode(jsonString);

  return jsonData
      .map((item) => Sitio(
            nombre: item['nombre'],
            ubicacion: item['ubicacion'],
            horario: item['horario'],
            comerCercano: item['comerCercano'],
          ))
      .toList();
}
