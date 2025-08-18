import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/models.dart';

Future<List<Sitio>> loadSitios() async {
  final data = await rootBundle.loadString('assets/data/sitios.json');
  final jsonResult = jsonDecode(data) as List<dynamic>;

  List<Sitio> sitios = [];
  for (var item in jsonResult) {
    try {
      sitios.add(Sitio.fromJson(item));
    } catch (e) {
      print('Error al parsear sitio: $item -> $e');
    }
  }
  return sitios;
}
