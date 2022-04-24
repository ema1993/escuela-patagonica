




class Inasistencia {
  
  String fecha;

  Inasistencia({this.fecha });
  Inasistencia.fromMap(Map data) {
    fecha = data['fecha'];
    
  }
}


class Materia{
  int cuatuno;
  int cuatdos;
  String nombre;
  int icono;

  Materia({ this.cuatuno, this.cuatdos, this.nombre, this.icono});
  Materia.fromMap(Map data) {
    cuatuno = data['cuatuno'];
    cuatdos = data['cuatdos'] ?? '';
    nombre = data['nombre'];
    icono = data['icono'];
  }
}


class Alumno{
  final String dni;
  final String nombre;
  final String domicilio;
  final String carrera;
  final List<Materia> materias;
  final List<Inasistencia> inasistencias;

  Alumno({ this.dni, this.nombre, this.domicilio, this.materias, this.inasistencias,this.carrera });

  factory Alumno.fromMap(Map data) {
    return Alumno(
      dni: data['dni'] ?? '',
      nombre: data['nombre'] ?? '',
      domicilio: data['domicilio'] ?? '',
      carrera: data['carrera'] ?? '',
      materias:  (data['materias'] as List ?? []).map((v) => Materia.fromMap(v)).toList(),
      inasistencias:  (data['inasistencias'] as List ?? []).map((v) => Inasistencia.fromMap(v)).toList(), //data['quizzes'],
      
    );
  }
  

}

class Clave {
  final String clave;
 

  Clave({ this.clave });

  factory Clave.fromMap(Map data) {
    return Clave(
      clave: data['clave'] ?? '',
      
    );
  }

}

class Avisos {
  final String titulo;
  final String cuerpo;
 

  Avisos({ this.titulo, this.cuerpo });

  factory Avisos.fromMap(Map data) {
    return Avisos(
      titulo: data['titulo'] ?? '',
      cuerpo: data['cuerpo'] ?? ''
      
    );
  }

}




class Curso { 
  
  List<Alumno> alumnos;

  Curso({this.alumnos});

  factory Curso.fromMap(Map data) {
    return Curso(
     
      alumnos: (data['alumnos'] as List ?? []).map((v) => Alumno.fromMap(v)).toList()
    );
  }
  
}