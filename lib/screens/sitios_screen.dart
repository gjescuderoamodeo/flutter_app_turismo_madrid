import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/sitio_service.dart';

class SitiosScreen extends StatefulWidget {
  @override
  State<SitiosScreen> createState() => _SitiosScreenState();
}

class _SitiosScreenState extends State<SitiosScreen> {
  List<Sitio>? sitios;

  @override
  void initState() {
    super.initState();
    loadSitios().then((data) {
      setState(() {
        sitios = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final tableHeight = MediaQuery.of(context).size.height * 0.5;

    return sitios == null
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: tableHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nombre del sitio')),
                ],
                rows: sitios!.map((sitio) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(sitio.nombre),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(sitio.nombre),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ubicación: ${sitio.ubicacion}'),
                                  Text('Horario: ${sitio.horario}'),
                                  Text('Comer cercano: ${sitio.comerCercano}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cerrar'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
  }
}
