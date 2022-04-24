import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import './globals.dart';
import 'models.dart';



class Document<T> {
  final Firestore _db = Firestore.instance;
  final String path; 
  DocumentReference ref;

  Document({ this.path }) {
    ref = _db.document(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }

  Stream<T> streamData() {
    return ref.snapshots().map((v) => Global.models[T](v.data) as T);
  }

  Future<void> upsert(Map data) {
    return ref.setData(Map<String, dynamic>.from(data), merge: true);
  }

}

class Collection<T> {
  final Firestore _db = Firestore.instance;
  final String path; 
  CollectionReference ref;

  Collection({ this.path }) {
    ref = _db.collection(path);
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.getDocuments();
    return snapshots.documents.map((doc) => Global.models[T](doc.data) as T ).toList();
  }

  Future<List<T>> getDatadni(String dni) async {
    var snapshots = await ref.where('dni',isEqualTo: dni).getDocuments();
    return snapshots.documents.map((doc) => Global.models[T](doc.data) as T ).toList();
  }

  Future<bool> getDatos(String dni) async {
  
    var snapshots = await ref.where('dni',isEqualTo: dni).getDocuments();
    List<Alumno> alumnos = snapshots.documents.map((doc) => Global.models[Alumno](doc.data) as Alumno ).toList();
    //print(alumnos);
    if(alumnos.isEmpty)
    {
      return true;
    }
    else{
      return false;
    }
    
  }

  Future<bool> getClave(String password) async {
    
    var snapshots = await ref.where('clave',isEqualTo: password).getDocuments();
    List<Clave> clave =  snapshots.documents.map((doc) => Global.models[Clave](doc.data) as Clave ).toList();
     if(clave.isEmpty)
    {
      return true;
    }
    else{
      return false;
    }
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map((list) => list.documents.map((doc) => Global.models[T](doc.data) as T) );
  }
}


class UserData<T> {
 // final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;

  UserData({ this.collection });


  Stream<T> get documentStream {

    return _auth.onAuthStateChanged.switchMap((user) {
      if (user != null) {
          Document<T> doc = Document<T>(path: '$collection/${user.uid}'); 
          return doc.streamData();
      } else {
          return Stream<T>.value(null);
      }
    });
  }

  Future<T> getDocument() async {
    FirebaseUser user = await _auth.currentUser();

    if (user != null) {
      Document doc = Document<T>(path: '$collection/${user.uid}'); 
      return doc.getData();
    } else {
      return null;
    }

  }

  Future<void> upsert(Map data) async {
    FirebaseUser user = await _auth.currentUser();
    Document<T> ref = Document(path:  '$collection/${user.uid}');
    return ref.upsert(data);
  }

}
