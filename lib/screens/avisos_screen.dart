import 'package:animate_do/animate_do.dart';
import 'package:escuela_patagonica/services/services.dart';
import 'package:escuela_patagonica/shared/shared.dart';
import 'package:flutter/material.dart';

class AvisosScreen extends StatelessWidget {
  static const String id = 'avisos_screen';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Global.avisosRef.getData(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<Avisos> aviso = snap.data;
            List<Widget> itemMap = aviso
                .map((aviso) => FadeInUp(
                      child: AvisoItem(
                        icon: Icons.email,
                        titulo: aviso.titulo,
                        cuerpo: aviso.cuerpo,
                        color1: Color(0xFF5EA2AC),
                        color2: Color(0xFF467981),
                      ),
                    ))
                .toList();
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF5EA2AC),
                title: Text('Avisos'),
              ),
              body: Stack(
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
              ),
            );
          } else {
            return LoadingScreen();
          }
        });
  }
}
