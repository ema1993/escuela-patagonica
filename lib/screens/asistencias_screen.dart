import 'package:escuela_patagonica/services/models.dart';
import 'package:escuela_patagonica/shared/shared.dart';
import 'package:flutter/material.dart';

class AsistenciasScreen extends StatelessWidget {
  static const String id = 'asistencias_screen';

  final List<Alumno> alumnos;

  AsistenciasScreen({this.alumnos});

  @override
  Widget build(BuildContext context) {
    if (alumnos != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Asistencias'),
          backgroundColor: Color(0xFF5EA2AC),
        ),
        body: Column(
            children: alumnos.map((alumno) => _Grid(alumnos: alumno)).toList()),
      );
    } else {
      return LoadingScreen();
    }
  }
}

class _Grid extends StatelessWidget {
  final Alumno alumnos;

  _Grid({this.alumnos});

  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;

    List<Widget> itemMap = alumnos.inasistencias
        .map(
          (inasistencia) => Center(
            child: Container(
              height: 30,
              child: Text(
                inasistencia.fecha,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        )
        .toList();

    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              alumnos.inasistencias.length.toString(),
              style: TextStyle(fontSize: 60),
            ),
            Text(
              'Cantidad de Inasistencias',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Container(
              height: 2,
              width: widthPantalla - 40,
              color: Colors.grey.withOpacity(0.3),
            ),
            SizedBox(height: 30),
            Text(
              'Fechas de tus inasistencias',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              color: Colors.grey.withOpacity(0.3),
              height: 100,
              child: ListView(
                padding: EdgeInsets.only(top: 25),
                children: <Widget>[
                  ...itemMap, //... - operador spread
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              '*Recordá que si alcanzas las 6 inasistencias \n pasarás a la condición de alumno libre',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
