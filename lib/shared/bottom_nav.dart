import 'package:escuela_patagonica/screens/materias_screen.dart';
import 'package:escuela_patagonica/screens/screens.dart';
import 'package:escuela_patagonica/services/models.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  final List<Alumno> alumno;

  AppBottomNav({this.alumno});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userCircle, size: 20),
            title: Text('Perfil')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookOpen, size: 20),
            title: Text('Materias')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.graduationCap, size: 20),
            title: Text('Asistencias')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.envelope, size: 20),
            title: Text('Avisos')),
      ].toList(),
      fixedColor: Color(0xFF5EA2AC),
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // do nuttin
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MateriasScreen(
                          alumnos: alumno,
                        )));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AsistenciasScreen(
                          alumnos: alumno,
                        )));
            break;
            case 3:
            Navigator.pushNamed(
                context, AvisosScreen.id);
            break;
          
        }
      },
    );
  }
}
