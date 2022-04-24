import 'package:escuela_patagonica/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:escuela_patagonica/components/rounded_button.dart';
import 'package:escuela_patagonica/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:escuela_patagonica/services/services.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginTextController = TextEditingController();
  final passTextController = TextEditingController();
  //final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  bool _obscureText = true;
  String _dni;
  String _password;
  Future<QuerySnapshot> currentStream;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5EA2AC)),
        ),
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                //Este widget permite que el Hero sea flexible, osea que
                //cuando no pueda tomar los 200 pixeles, este widget lo achicara
                //para evitar problemas de visualizacion en la UI
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: loginTextController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  _dni = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'DNI',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Stack(
                children: <Widget>[
                  TextField(
                    controller: passTextController,
                    obscureText: _obscureText,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      _password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Contraseña',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                        icon: (_obscureText)
                            ? Icon(
                                FontAwesomeIcons.eye,
                                size: 20,
                                color: Colors.black45,
                              )
                            : Icon(FontAwesomeIcons.eyeSlash,
                                size: 20, color: Colors.black45),
                        onPressed: () {
                          setState(() {
                            if (_obscureText) {
                              _obscureText = false;
                            } else {
                              _obscureText = true;
                            }
                          });
                        }),
                  )
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Color(0xFF5EA2AC),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      var verificarDni = await Global.alumnosRef.getDatos(_dni);
                      var verificarClave =
                          await Global.claveRef.getClave(_password);

                      if (!verificarDni &&
                          !verificarClave &&
                          _dni != null &&
                          _password != null) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return ProfileScreen(dni: _dni);
                        }), (route) => false);
                        loginTextController.clear();
                        passTextController.clear();
                      } else {
                        Alert(
                          context: context,
                          title: "Credenciales incorrectas",
                          desc: "Revisa el dni y la contraseña",
                          buttons: [
                            DialogButton(
                              child: Text(
                                'ACEPTAR',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ).show();
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  text: 'Iniciar sesión')
            ],
          ),
        ),
      ),
    );
  }
}
