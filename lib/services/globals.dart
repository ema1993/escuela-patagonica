import 'services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


/// Static global state. Immutable services that do not care about build context. 
class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

    // Data Models
  static final Map models = {
   // Topic: (data) => Topic.fromMap(data),
    Alumno: (data) => Alumno.fromMap(data),
    Clave: (data) => Clave.fromMap(data),
    Avisos: (data) => Avisos.fromMap(data),
   // Report: (data) => Report.fromMap(data),
  };

  // Firestore References for Writes
  //static final Collection<Topic> topicsRef = Collection<Topic>(path: 'topics');
  //static final UserData<Report> reportRef = UserData<Report>(collection: 'reports'); 
  static final Collection<Alumno> alumnosRef = Collection<Alumno>(path: 'alumnos');
  static final Collection<Clave> claveRef = Collection<Clave>(path: 'claves');
  static final Collection<Avisos> avisosRef = Collection<Avisos>(path: 'avisos');
  
}
