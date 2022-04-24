import 'package:animate_do/animate_do.dart';
import 'package:escuela_patagonica/services/models.dart';
import 'package:escuela_patagonica/shared/loader.dart';
import 'package:escuela_patagonica/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriasScreen extends StatelessWidget {
  static const String id = 'materias_screen';

  final List<Alumno> alumnos;

  MateriasScreen({this.alumnos});

  @override
  Widget build(BuildContext context) {
    if (alumnos != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Materias'),
          backgroundColor: Color(0xFF5EA2AC),
          
        ),
        
        body: Column(
              children: alumnos.map((alumno) => Expanded(child: _Grid(alumnos: alumno))).toList()),
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

    List<Widget> itemMap = alumnos.materias
        .map((materia) => FadeInLeft(
                  child: BotonGordo(
                icon: IconDataSolid(materia.icono),
                texto: materia.nombre,
                notauno: 'Primer examen: ${materia.cuatuno.toString()}',
                notados: 'Segundo examen: ${materia.cuatdos.toString()}',
                color1: Color(0xFF5EA2AC),
                color2: Color(0xFF467981),
                
              ),
        ))
        .toList();

    return Stack(
      children: <Widget>[
        Container(
          
          child: ListView(
            physics:
                BouncingScrollPhysics(), //para que haga el rebote cuando llegue al final de la lista
            children: <Widget>[
              
              ...itemMap, //... - operador spread
            ],
          ),
        ),
        
      ],
    );
  }
}


