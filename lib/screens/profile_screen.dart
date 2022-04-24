import 'package:animate_do/animate_do.dart';
import 'package:escuela_patagonica/components/link_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/services.dart';
import '../shared/shared.dart';
import '../screens/screens.dart';
import 'package:escuela_patagonica/components/radial_progress.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile_screen';

  final String dni;

  ProfileScreen({this.dni});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Global.alumnosRef.getDatadni(dni),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<Alumno> alumno = snap.data;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF5EA2AC),
                title: Text('Perfil'),
                actions: [
                  IconButton(
                    icon:
                        Icon(FontAwesomeIcons.signOutAlt, color: Colors.white),
                    onPressed: () =>
                        Navigator.popAndPushNamed(context, LoginScreen.id),
                  )
                ],
              ),
              drawer: _MenuPrincipal(),
              body: Column(
                children:
                    alumno.map((alumno) => AlumnoItem(alumno: alumno)).toList(),
              ),
              bottomNavigationBar: AppBottomNav(
                alumno: alumno,
              ),
            );
          } else {
            return LoadingScreen();
          }
        });
  }
}

class AlumnoItem extends StatelessWidget {
  final Alumno alumno;
  AlumnoItem({this.alumno});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              alumno.nombre,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                alumno.carrera,
                style: TextStyle(color: Colors.black54, fontSize: 20.0),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            height: 300,
            child: RadialProgress(
              porcentaje: 40.0,
              colorPrimario: Color(0xFF5EA2AC),
              colorSecundario: Colors.black12,
              total: alumno.materias.length.toString()
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL(String link) async {
  String url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: ListView.separated(
        separatorBuilder: (context, i) => Divider(
          height: 1,
          color: Colors.white,
        ),
        itemCount: pageRoutes.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            _launchURL(pageRoutes[i].url);
          },
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(pageRoutes[i].photo),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 12),
                  width: 600,
                  height: 50,
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    pageRoutes[i].titulo,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: _ListaOpciones(),
      ),
    );
  }
}
