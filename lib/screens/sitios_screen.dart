import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/sitio_service.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // función auxiliar para abrir enlaces
  Future<void> _abrirEnlace(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir el enlace')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tableHeight = MediaQuery.of(context).size.height * 0.8;

    return sitios == null
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: tableHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      'Nombre del sitio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
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
                                  // Enlace clicable
                                  GestureDetector(
                                    onTap: () => _abrirEnlace(sitio.ubicacion),
                                    child: const Text(
                                      'Ver ubicación',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
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
