import 'package:myapp1/core/comparaciones.dart';
import 'package:myapp1/core/json.dart';
import 'package:myapp1/features/ofertas/domain/dinero.dart';
import 'package:myapp1/features/ofertas/domain/estado_oferta.dart';

/// Un producto en oferta.
///
/// Es una **entidad**: tiene identidad propia. Dos ofertas con el mismo
/// nombre son dos ofertas distintas si tienen `id` distinto.
class Oferta {
  const Oferta({
    required this.id,
    required this.nombreProducto,
    required this.categoria,
    required this.precioOriginal,
    required this.precioOferta,
    required this.cantidadDisponible,
    required this.fechaVencimiento,
    required this.estado,
    this.descripcion,
    this.fotos = const <String>[],
  });

  factory Oferta.fromJson(Map<String, dynamic> json) => Oferta(
    id: leerTexto(json, 'id'),
    nombreProducto: leerTexto(json, 'nombreProducto'),
    descripcion: leerTextoOpcional(json, 'descripcion'),
    categoria: leerTexto(json, 'categoria'),
    precioOriginal: Dinero.fromJson(leerMapa(json, 'precioOriginal')),
    precioOferta: Dinero.fromJson(leerMapa(json, 'precioOferta')),
    cantidadDisponible: leerEntero(json, 'cantidadDisponible'),
    fechaVencimiento: leerFecha(json, 'fechaVencimiento'),
    estado: EstadoOferta.fromJson(leerMapa(json, 'estado')),
    fotos: leerTextos(json, 'fotos'),
  );

  final String id;
  final String nombreProducto;
  final String? descripcion;
  final String categoria;
  final Dinero precioOriginal;
  final Dinero precioOferta;
  final int cantidadDisponible;
  final DateTime fechaVencimiento;
  final EstadoOferta estado;
  final List<String> fotos;

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombreProducto': nombreProducto,
    if (descripcion != null) 'descripcion': descripcion,
    'categoria': categoria,
    'precioOriginal': precioOriginal.toJson(),
    'precioOferta': precioOferta.toJson(),
    'cantidadDisponible': cantidadDisponible,
    'fechaVencimiento': fechaVencimiento.toUtc().toIso8601String(),
    'estado': estado.toJson(),
    'fotos': fotos,
  };

  // ── Reglas de negocio ───────────────────────────────────────────────────
  // Viven aquí, no en el widget.

  /// Depende solo de los campos: no necesita saber qué hora es.
  bool get tieneDescuento => precioOferta.valor < precioOriginal.valor;

  /// También depende solo de los campos.
  double get porcentajeDescuento {
    if (precioOriginal.valor == 0) return 0;
    final diferencia = precioOriginal.valor - precioOferta.valor;
    return (diferencia / precioOriginal.valor) * 100;
  }

  bool get sePuedeComprar => estado.sePuedeComprar;

  bool get tieneFotos => fotos.isNotEmpty;

  /// El reloj entra como parámetro, no se lee dentro.
  ///
  /// Con `DateTime.now()` dentro, esta regla no se podría probar: el
  /// resultado dependería del día en que se corra la prueba.
  bool estaVencida(DateTime ahora) => ahora.isAfter(fechaVencimiento);

  // ── Copia ───────────────────────────────────────────────────────────────

  Oferta copyWith({
    String? nombreProducto,
    String? descripcion,
    String? categoria,
    Dinero? precioOriginal,
    Dinero? precioOferta,
    int? cantidadDisponible,
    DateTime? fechaVencimiento,
    EstadoOferta? estado,
    List<String>? fotos,
  }) => Oferta(
    id: id, // la identidad NO se copia con cambios
    nombreProducto: nombreProducto ?? this.nombreProducto,
    descripcion: descripcion ?? this.descripcion,
    categoria: categoria ?? this.categoria,
    precioOriginal: precioOriginal ?? this.precioOriginal,
    precioOferta: precioOferta ?? this.precioOferta,
    cantidadDisponible: cantidadDisponible ?? this.cantidadDisponible,
    fechaVencimiento: fechaVencimiento ?? this.fechaVencimiento,
    estado: estado ?? this.estado,
    fotos: fotos ?? this.fotos,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Oferta &&
          other.id == id &&
          other.nombreProducto == nombreProducto &&
          other.descripcion == descripcion &&
          other.categoria == categoria &&
          other.precioOriginal == precioOriginal &&
          other.precioOferta == precioOferta &&
          other.cantidadDisponible == cantidadDisponible &&
          other.fechaVencimiento == fechaVencimiento &&
          other.estado == estado &&
          listasIguales(other.fotos, fotos);

  @override
  int get hashCode => Object.hash(
    id,
    nombreProducto,
    descripcion,
    categoria,
    precioOriginal,
    precioOferta,
    cantidadDisponible,
    fechaVencimiento,
    estado,
    Object.hashAll(fotos), // NO Object.hash(fotos): eso hashea la referencia
  );

  @override
  String toString() => 'Oferta($id, $nombreProducto, ${estado.etiqueta})';
}
