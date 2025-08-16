import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

enum SampleItem2 { itemOne, itemTwo, itemThree }

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //variable menú desplegable
  SampleItem2? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2, title: const Text("TourBoost")),
      body: Stack(
        children: [
          // Background
          //Background(),
          // Home Body
          _HomeBody()
        ],
      ),
      //bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Titulos
          //PageTitle2(),
          // Card Table
          //CardTable2(),
        ],
      ),
    );
  }
}
