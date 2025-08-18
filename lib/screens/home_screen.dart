import 'package:flutter/material.dart';
import 'package:flutter_app_turismo_madrid/screens/sitios_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.green,
        title: const Text(
          "Viaje madrid",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Título de la página
            const PageTitle(),
            const SizedBox(height: 20),
            // Lista de sitios
            SitiosScreen(),
          ],
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Guía viaje Madrid',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
