import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvisoItem extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String cuerpo;

  final Color color1;
  final Color color2;

  AvisoItem({
    this.icon = FontAwesomeIcons.circle,
    @required this.titulo,
    @required this.cuerpo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BotonGordoBackground(this.icon, this.color1, this.color2),
        Row(
          children: <Widget>[
            SizedBox(height: 140, width: 40),
            FaIcon(
              this.icon,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.titulo,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      this.cuerpo,
                      style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  _BotonGordoBackground(this.icon, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        //se uso el clipRRect para cortar el sobrante del icono del auto
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10),
          ],
          borderRadius: BorderRadiusDirectional.circular(15),
          gradient: LinearGradient(colors: <Color>[this.color1, this.color2])),
    );
  }
}
