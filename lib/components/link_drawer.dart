final pageRoutes = <_Route>[
  _Route('images/cocinero.jpg', 'Cocinero Profesional',
      'http://escuelapatagonica.com/carrera-cocina-profesional/'),
  _Route('images/pasteleria.jpg', 'Pastelería Profesional',
      'http://escuelapatagonica.com/carrera-pasteleria-profesional/'),
  _Route('images/panificacion.jpg', 'Panificación Profesional',
      'http://escuelapatagonica.com/carrera-panificacion-profesional/'),
  _Route('images/bartender.jpg', 'Bartender Profesional',
      'http://escuelapatagonica.com/carrera-bartender-profesional/'),
  _Route('images/intensiva.jpg', 'Cocina Profesional Intensiva',
      'http://escuelapatagonica.com/carrera-cocina-profesional-intensiva/')
];

class _Route {
  final String photo;
  final String titulo;
  final String url;

  _Route(this.photo, this.titulo, this.url);
}
