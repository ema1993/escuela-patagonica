import 'package:escuela_patagonica/screens/profile_screen.dart';


import 'package:flutter/material.dart';


import 'screens/screens.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
//      theme: ThemeData.dark().copyWith(
//        textTheme: TextTheme(
//          body1: TextStyle(color: Colors.black54),
//        ),
//      ),
    initialRoute: LoginScreen.id,
    routes: {
      LoginScreen.id: (context) => LoginScreen(),
      ProfileScreen.id: (context) => ProfileScreen(),
      MateriasScreen.id: (context) => MateriasScreen(),
      AsistenciasScreen.id: (context) => AsistenciasScreen(),
      AvisosScreen.id: (context) => AvisosScreen()
    },
        );
  }
}
